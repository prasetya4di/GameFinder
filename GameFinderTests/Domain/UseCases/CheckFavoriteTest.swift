//
//  CheckFavoriteTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import CoreData
import XCTest
@testable import GameFinder

final class CheckFavoriteTest: XCTestCase {
    
    private var mockGameRepository: MockGameRepository!
    private var checkFavorite: CheckFavorite!

    override func setUp() {
        mockGameRepository = MockGameRepository()
        checkFavorite = CheckFavoriteImpl(mockGameRepository)
    }
    
    func testCheckFavoriteGameSuccessWithTrue() throws {
        let expectedGame = createGame()
        mockGameRepository.expectedFavoriteGames.append(expectedGame)
        
        let result = try checkFavorite.call(expectedGame.id)
        
        XCTAssertTrue(result)
    }
    
    func testCheckFavoriteGameSuccessWithFalse() throws {
        let result = try checkFavorite.call(randomInt)
        
        XCTAssertFalse(result)
    }
    
    func testCheckFavoriteGameFailed() throws {
        let expectedError = NSError(domain: "CoreData", code: NSCoreDataError)
        mockGameRepository.error = expectedError
        
        do {
            _ = try checkFavorite.call(randomInt)
            
            XCTFail("Get games should throw the error")
        } catch let exception {
            XCTAssertEqual(exception as NSError, expectedError)
        }
    }
}
