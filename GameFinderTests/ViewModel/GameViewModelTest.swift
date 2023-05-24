//
//  GameViewModelTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import CoreData
import Combine
import XCTest
@testable import GameFinder

final class GameViewModelTest: XCTestCase {
    
    private var mockGetGames: MockGetGames!
    private var mockSearchGames: MockSearchGames!
    private var gameViewModel: GameViewModel!
    
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        mockGetGames = MockGetGames()
        mockSearchGames = MockSearchGames()
        gameViewModel = GameViewModel(
            mockGetGames,
            mockSearchGames
        )
    }
    
    func testGetGamesSuccess() throws {
        let expectedGames = createListGame()
        mockGetGames
            .expectedGames
            .append(contentsOf: expectedGames)
        
        let expectedState = GameViewState(
            games: expectedGames
        )
        
        testViewModel(
            description: "Get Games",
            expectedState: expectedState,
            intent: .getGames
        )
    }
    
    func testGetGamesError() throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockGetGames.error = expectedError
        
        let expectedState = GameViewState(
        	error: expectedError
        )
        
        testViewModel(
            description: "Get Games Error",
            expectedState: expectedState,
            intent: .getGames
        )
    }
    
    func testSearchGames() throws {
        let searchQuery = randomString(length: 5)
        let expectedGames = createListGame()
        mockSearchGames.expectedGames = expectedGames
        
        let expectedState = GameViewState(
            games: expectedGames,
            searchQuery: searchQuery
        )
        
        testViewModel(
            description: "Test Search Games success",
            expectedState: expectedState,
            intent: .searchGames(searchQuery)
        )
    }
    
    func testSearchGamesError() throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockSearchGames.error = expectedError
        
        let expectedState = GameViewState(
            error: expectedError
        )
        
        testViewModel(
            description: "Test Search Games Error",
            expectedState: expectedState,
            intent: .searchGames(randomString(length: 5))
        )
    }
    
    func testLoadMore() throws {
        let expectedGames = createListGame()
        mockGetGames.expectedGames = expectedGames
        
        let expectedState = GameViewState(
            games: expectedGames + expectedGames,
            page: 2
        )
        
        gameViewModel.dispatch(.getGames)
        testViewModel(
            description: "Load more success",
            expectedState: expectedState,
            intent: .loadMore(2, nil)
        )
    }
    
    func testLoadMoreWithSearch() throws {
        let searchQuery = randomString(length: 5)
        let expectedGames = createListGame()
        mockSearchGames.expectedGames = expectedGames
        
        let expectedState = GameViewState(
            games: expectedGames + expectedGames,
            searchQuery: searchQuery,
            page: 2
        )
        
        gameViewModel.dispatch(.searchGames(searchQuery))
        testViewModel(
            description: "Load more with search success",
            expectedState: expectedState,
            intent: .loadMore(2, searchQuery)
        )
    }
    
    func testViewModel(
        description: String,
        expectedState: GameViewState,
        intent: GameViewIntent
    ) {
        let expectation = XCTestExpectation(description: description)
        
        gameViewModel.$viewState
            .sink { viewState in
                if viewState == expectedState {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        gameViewModel.dispatch(intent)
        
        wait(for: [expectation], timeout: 1)
    }
}
