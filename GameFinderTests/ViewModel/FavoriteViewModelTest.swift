//
//  FavoriteViewModelTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Combine
import CoreData
import XCTest
@testable import GameFinder

final class FavoriteViewModelTest: XCTestCase {
    
    private var mockGetFavoriteGames: MockGetFavoriteGames!
    private var favoriteViewModel: FavoriteViewModel!
    
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        mockGetFavoriteGames = MockGetFavoriteGames()
        favoriteViewModel = FavoriteViewModel(mockGetFavoriteGames)
    }
    
    func testGetFavoriteGamesSuccess() throws {
        let expectedGames = createListGame()
        mockGetFavoriteGames
            .expectedGames
            .append(contentsOf: expectedGames)
        
        let expectedState = FavoriteViewState(
            games: expectedGames
        )
        
        testViewModel(
            description: "Get Favorite Games Success",
            expectedState: expectedState,
            intent: .getFavoriteGames
        )
    }
    
    func testGetFavoriteGamesError() throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockGetFavoriteGames.error = expectedError
        
        let expectedState = FavoriteViewState(
            error: expectedError
        )
        
        testViewModel(
            description: "Get Favorite Games Error",
            expectedState: expectedState,
            intent: .getFavoriteGames
        )
    }
	
    func testViewModel(
        description: String,
        expectedState: FavoriteViewState,
        intent: FavoriteViewIntent
    ) {
        let expectation = XCTestExpectation(description: description)
        
        favoriteViewModel.$viewState
            .sink { viewState in
                if viewState == expectedState {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        favoriteViewModel.dispatch(intent)
        
        wait(for: [expectation], timeout: 1)
    }
}
