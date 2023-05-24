//
//  GetGameTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import XCTest
@testable import GameFinder

final class GetGameTest: XCTestCase {

    private var mockGameRepository: MockGameRepository!
    private var getGames: GetGames!
    
    override func setUpWithError() throws {
        mockGameRepository = MockGameRepository()
        getGames = GetGamesImpl(mockGameRepository)
    }
    
    func testGetGamesSuccess() async throws {
        let expectedGames = createListGame()
        mockGameRepository.expectedGames = expectedGames
        
        let result = try await getGames.call(page: 1)
        
        XCTAssertEqual(expectedGames, result)
    }
    
    func testGetGamesFailed() async throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockGameRepository.error = expectedError
        
        do {
            _ = try await getGames.call(page: 1)
            
            XCTFail("Get games should throw the error")
        } catch let exception {
            XCTAssertEqual(exception as? URLError, expectedError)
        }
    }
}
