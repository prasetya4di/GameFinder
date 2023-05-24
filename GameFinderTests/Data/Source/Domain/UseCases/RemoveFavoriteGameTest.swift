//
//  RemoveFavoriteGameTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import CoreData
import XCTest
@testable import GameFinder

final class RemoveFavoriteGameTest: XCTestCase {
    
    private var mockGameRepository: MockGameRepository!
    private var removeFavoriteGame: RemoveFavoriteGame!

    override func setUp() {
        mockGameRepository = MockGameRepository()
        removeFavoriteGame = RemoveFavoriteGameImpl(mockGameRepository)
    }
    
    func testRemoveFavoriteGamesSuccess() throws {
        var expectedGames = createListGame()
        mockGameRepository
            .expectedFavoriteGames
            .append(contentsOf: expectedGames)
        
        try removeFavoriteGame.call(expectedGames.first?.id ?? 0)
        
        expectedGames.removeFirst()
        
        XCTAssertEqual(mockGameRepository.expectedFavoriteGames, expectedGames)
    }
    
    func testGetFavoriteGamesFailed() throws {
        let expectedError = NSError(domain: "CoreData", code: NSCoreDataError)
        mockGameRepository.error = expectedError
        
        do {
            try removeFavoriteGame.call(randomInt)
            
            XCTFail("Get games should throw the error")
        } catch let exception {
            XCTAssertEqual(exception as NSError, expectedError)
        }
    }
}
