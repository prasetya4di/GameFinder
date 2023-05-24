//
//  GameDetailViewModel.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Combine
import Foundation

class GameDetailViewModel: ObservableObject {
    private var viewStateSubject = CurrentValueSubject<GameDetailViewState, Never>(.idle())
    
    @Published private(set) var viewState: GameDetailViewState = .idle()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let intentSubject = PassthroughSubject<GameDetailIntent, Never>()
    
    private let getDetail: GetGameDetail
    private let addFavorite: AddFavoriteGame
    private let removeFavorite: RemoveFavoriteGame
    private let checkFavorite: CheckFavorite
    
    init(
        _ getDetail: GetGameDetail,
        _ addFavorite: AddFavoriteGame,
        _ removeFavorite: RemoveFavoriteGame,
        _ checkFavorite: CheckFavorite
    ) {
        self.getDetail = getDetail
        self.addFavorite = addFavorite
        self.removeFavorite = removeFavorite
        self.checkFavorite = checkFavorite
        
        bind()
    }
    
    func dispatch(_ intent: GameDetailIntent) {
        intentSubject.send(intent)
    }
    
    private func bind() {
        viewStateSubject
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] newState in
                self.viewState = newState
            }
            .store(in: &cancellables)
        
        intentSubject
            .receive(on: DispatchQueue.main)
            .flatMap { [unowned self] intent in
                self.process(intent)
            }
            .combineLatest(viewStateSubject)
            .map { [unowned self] intentResult, currentState in
                self.reduce(currentState, intentResult)
            }
            .sink { [unowned self] newState in
                self.viewStateSubject.send(newState)
            }
            .store(in: &cancellables)
    }
    
    private func process(
        _ intent: GameDetailIntent
    ) -> AnyPublisher<GameDetailResult, Never> {
        switch intent {
            case .getDetail(let id):
                return createPublisher { [unowned self] in
                    try await self.getDetail.call(id)
                }
                .flatMap { detail in
                    return createPublisher { [unowned self] in
                        try self.checkFavorite.call(id)
                    }
                    .map { isFavorite in
                    	.getDetailResult(.success(detail, isFavorite))
                    }
                    .eraseToAnyPublisher()
                }
                .catch { error in
                    Just(.getDetailResult(.error(error)))
                        .eraseToAnyPublisher()
                }
                .prepend(.getDetailResult(.loading))
                .eraseToAnyPublisher()
            case .addToFavorite(let game):
                return createPublisher { [unowned self] in
                	self.addFavorite.call(game)
                }
                .map { detail in
                    .addToFavoriteResult(.success)
                }
                .catch { error in
                    Just(.addToFavoriteResult(.error(error)))
                        .eraseToAnyPublisher()
                }
                .prepend(.addToFavoriteResult(.loading))
                .eraseToAnyPublisher()
            case .removeFromFavorite(let id):
                return createPublisher { [unowned self] in
                    try self.removeFavorite.call(id)
                }
                .map { detail in
                    .removeFromFavoriteResult(.success)
                }
                .catch { error in
                    Just(.removeFromFavoriteResult(.error(error)))
                        .eraseToAnyPublisher()
                }
                .prepend(.removeFromFavoriteResult(.loading))
                .eraseToAnyPublisher()
            case .hideToast:
                return Just(.hideToastResult)
                    .eraseToAnyPublisher()
        }
    }
    
    private func reduce(
        _ prevState: GameDetailViewState,
        _ result: GameDetailResult
    ) -> GameDetailViewState {
        var state = prevState
        
        switch result {
            case .getDetailResult(let status):
                switch status {
                    case .loading:
                        state.isLoading = true
                    case .success(let detail, let isFavorited):
                        state.isLoading = false
                        state.detail = detail
                        state.isFavorite = isFavorited
                    case .error(let error):
                        state.isLoading = false
                        state.error = error
                }
            case .addToFavoriteResult(let status):
                switch status {
                    case .loading: break
                    case .success:
                        state.showToast = true
                        state.isFavorite = true
                    case .error(let error):
                        state.error = error
                }
            case .removeFromFavoriteResult(let status):
                switch status {
                    case .loading: break
                    case .success:
                        state.showToast = true
                        state.isFavorite = false
                    case .error(let error):
                        state.error = error
                }
            case .hideToastResult:
                state.showToast = false
        }
        
        return state
    }
}
