//
//  FavoriteViewModel.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Combine
import Foundation

class FavoriteViewModel: ObservableObject {
    private var viewStateSubject = CurrentValueSubject<FavoriteViewState, Never>(.idle())
    
    @Published private(set) var viewState: FavoriteViewState = .idle()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let intentSubject = PassthroughSubject<FavoriteViewIntent, Never>()
    
    private let getFavoriteGames: GetFavoriteGames
    
    init(_ getFavoriteGames: GetFavoriteGames) {
        self.getFavoriteGames = getFavoriteGames
        
        bind()
    }
    
    func dispatch(_ intent: FavoriteViewIntent) {
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
    
    private func process(_ intent: FavoriteViewIntent) -> AnyPublisher<FavoriteViewResult, Never> {
        switch intent {
            case .getFavoriteGames:
                return createPublisher { [unowned self] in
                    try self.getFavoriteGames.call()
                }
                .map { games in
                    return .getFavoriteGamesResult(.success(games))
                }
                .catch { err in
                    return Just(.getFavoriteGamesResult(.error(err)))
                        .eraseToAnyPublisher()
                }
                .prepend(.getFavoriteGamesResult(.loading))
                .eraseToAnyPublisher()
        }
    }
    
    private func reduce(_ prevState: FavoriteViewState, _ result: FavoriteViewResult) -> FavoriteViewState {
        var state = prevState
        
        switch result {
            case .getFavoriteGamesResult(let status):
                switch status {
                    case .loading:
                        state.isLoading = true
                    case .success(let games):
                        state.isLoading = false
                        state.games = games
                    case .error(let error):
                        state.isLoading = false
                        state.error = error
                }
        }
        
        return state
    }
}
