//
//  AddFavoriteGameTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import XCTest
@testable import GameFinder

final class AddFavoriteGameTest: XCTestCase {
    
    private var mockGameRepository: MockGameRepository!
    private var addFavoriteGame: AddFavoriteGame!

    override func setUp() {
       	mockGameRepository = MockGameRepository()
        addFavoriteGame = AddFavoriteGameImpl(mockGameRepository)
    }
    
    func testGetFavoriteGamesSuccess() throws {
        let expectedGames = createGame()
        
        addFavoriteGame.call(expectedGames)
        
        XCTAssertTrue(mockGameRepository.expectedGames.contains(expectedGames))
    }
}
