//
//  GetFavoriteGames.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import XCTest
@testable import GameFinder

final class GetFavoriteGamesTest: XCTestCase {
    
    private var mockGameRepository: MockGameRepository!
    private var getFavoriteGames: GetFavoriteGames!

    override func setUp() {
        mockGameRepository = MockGameRepository()
        getFavoriteGames = GetFavoriteGamesImpl(mockGameRepository)
    }
    
    func testGetFavoriteGamesSuccess() throws {
        let expectedGames = createListGame()
        mockGameRepository.expectedFavoriteGames = expectedGames
        
        let result = try getFavoriteGames.call()
        
        XCTAssertEqual(expectedGames, result)
    }
    
    func testGetFavoriteGamesFailed() throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockGameRepository.error = expectedError
        
        do {
            _ = try getFavoriteGames.call()
            
            XCTFail("Get games should throw the error")
        } catch let exception {
            XCTAssertEqual(exception as? URLError, expectedError)
        }
    }
}
