//
//  GameDetailViewModelTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Combine
import CoreData
import XCTest
@testable import GameFinder

final class GameDetailViewModelTest: XCTestCase {
    
    private var mockGetGameDetail: MockGetGameDetail!
    private var mockCheckFavorite: MockCheckFavorite!
    private var mockAddFavorite: MockAddFavoriteGame!
    private var mockRemoveFavorite: MockRemoveFavoriteGame!
    private var gameDetailViewModel: GameDetailViewModel!
    
    private var cancellables = Set<AnyCancellable>()

    override func setUp() {
        mockGetGameDetail = MockGetGameDetail()
        mockCheckFavorite = MockCheckFavorite()
        mockAddFavorite = MockAddFavoriteGame()
        mockRemoveFavorite = MockRemoveFavoriteGame()
        gameDetailViewModel = GameDetailViewModel(
            mockGetGameDetail,
            mockAddFavorite,
            mockRemoveFavorite,
            mockCheckFavorite
        )
    }
    
    func testGetDetailSuccess() throws {
        let expectedId = randomInt
        let expectedGameDetail = createGameDetail()
        mockGetGameDetail.expectedGameDetail = expectedGameDetail
        
        let expectedState = GameDetailViewState(
            detail: expectedGameDetail
        )
        
        testViewModel(
            description: "Get Detail Success",
            expectedState: expectedState,
            intent: .getDetail(expectedId)
        )
    }
    
    func testGetDetailError() throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockGetGameDetail.error = expectedError
        
        let expectedState = GameDetailViewState(
            error: expectedError
        )
        
        testViewModel(
            description: "Get Detail Error",
            expectedState: expectedState,
            intent: .getDetail(randomInt)
        )
    }
    
    func testAddFavoriteSuccess() throws {
        let expectedGame = createGame()
        
        let expectedState = GameDetailViewState(
            isFavorite: true
        )
        
        testViewModel(
            description: "Add Favorite Success",
            expectedState: expectedState,
            intent: .addToFavorite(expectedGame)
        )
        
        XCTAssertTrue(mockAddFavorite
            .expectedGame
            .contains(expectedGame)
        )
    }
    
    func testRemoveFavoriteSuccess() throws {
        let expectedGame = createGame()
        mockRemoveFavorite
            .expectedGames
            .append(expectedGame)
        
        let expectedState = GameDetailViewState()
        
        testViewModel(
            description: "Remove Favorite Success",
            expectedState: expectedState,
            intent: .removeFromFavorite(expectedGame.id)
        )
    }
    
    func testRemoveFavoriteFailed() throws {
        let expectedError = NSError(
            domain: "Error Core Data",
            code: NSCoreDataError
        )
        mockRemoveFavorite.error = expectedError
        
        let expectedState = GameDetailViewState(
        	error: expectedError
        )
        
        testViewModel(
            description: "Remove Favorite Failed",
            expectedState: expectedState,
            intent: .removeFromFavorite(randomInt)
        )
    }

    func testViewModel(
        description: String,
        expectedState: GameDetailViewState,
        intent: GameDetailIntent
    ) {
        let expectation = XCTestExpectation(description: description)
        
        gameDetailViewModel.$viewState
            .sink { viewState in
                if viewState == expectedState {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        gameDetailViewModel.dispatch(intent)
        
        wait(for: [expectation], timeout: 1)
    }
}
