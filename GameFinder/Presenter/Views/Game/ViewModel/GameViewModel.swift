//
//  GameViewModel.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Combine
import Foundation

class GameViewModel: ObservableObject {
    private var viewStateSubject = CurrentValueSubject<GameViewState, Never>(.idle())
    
    @Published private(set) var viewState: GameViewState = .idle()
    
    private var cancellables = Set<AnyCancellable>()
    
    private let intentSubject = PassthroughSubject<GameViewIntent, Never>()
    
    private let getGames: GetGames
    private let searchGames: SearchGames
    
    init(_ getGames: GetGames, _ searchGames: SearchGames) {
        self.getGames = getGames
        self.searchGames = searchGames
        
    	bind()
    }
    
    func dispatch(_ intent: GameViewIntent) {
        intentSubject.send(intent)
    }
    
    private func bind() {
        viewStateSubject
            .sink(receiveValue: { [unowned self] newState in
                self.viewState = newState
            })
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
    
    private func process(_ intent: GameViewIntent) -> AnyPublisher<GameViewResult, Never> {
        switch intent {
            case .getGames:
                return createPublisher { [unowned self] in
                    try await self.getGames.call(page: 1)
                }
                .map { games in
                    return .getGamesResult(.success(games))
                }
                .catch { err in
                    return Just(.getGamesResult(.error(err)))
                        .eraseToAnyPublisher()
                }
                .prepend(.getGamesResult(.loading))
                .eraseToAnyPublisher()
            case .searchGames(let searchQuery):
                return createPublisher { [unowned self] in
                    try await self.searchGames.call(page: 1, search: searchQuery)
                }
                .map { games in
                    return .searchGamesResult(.success(games, searchQuery))
                }
                .catch { err in
                    return Just(.searchGamesResult(.error(err)))
                        .eraseToAnyPublisher()
                }
                .prepend(.searchGamesResult(.loading))
                .eraseToAnyPublisher()
            case .loadMore(let nextPage, let searchQuery):
                return createPublisher { [unowned self] in
                    if let searchQuery, !searchQuery.isEmpty {
                        return try await self.searchGames.call(
                            page: nextPage,
                            search: searchQuery
                        )
                    } else {
                        return try await self.getGames.call(page: nextPage)
                    }
                }
                .map { games in
                    return .loadMoreResult(.success(games, nextPage))
                }
                .catch { err in
                    return Just(.loadMoreResult(.error(err)))
                        .eraseToAnyPublisher()
                }
                .prepend(.loadMoreResult(.loading))
                .eraseToAnyPublisher()
        }
    }
    
    private func reduce(_ prevState: GameViewState, _ result: GameViewResult) -> GameViewState {
        var state = prevState
        
        switch result {
            case .getGamesResult(let status):
                switch status {
                    case .loading:
                        state.page = 1
                        state.isLoading = true
                        state.searchQuery = nil
                    case .success(let games):
                        state.isLoading = false
                        state.games = games
                    case .error(let error):
                        state.isLoading = false
                        state.error = error
                }
            case .searchGamesResult(let status):
                switch status {
                    case .loading:
                        state.page = 1
                        state.isLoading = true
                    case .success(let games, let searchQuery):
                        state.isLoading = false
                        state.games = games
                        state.searchQuery = searchQuery
                    case .error(let error):
                        state.isLoading = false
                        state.error = error
                }
            case .loadMoreResult(let status):
                switch status {
                    case .loading:
                        state.isLoadMore = true
                    case .success(let games, let nextPage):
                        state.isLoadMore = false
                        state.games.append(contentsOf: games)
                        state.page = nextPage
                    case .error(let error):
                        state.isLoadMore = false
                        state.error = error
                }
        }
        
        return state
    }
}
