//
//  GameServiceTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import XCTest
@testable import GameFinder

class GameServiceTests: XCTestCase {
    
    var mockApiClient: MockApiClient<GamesResponse>!
    var gameService: GameService!
    
    override func setUpWithError() throws {
        mockApiClient = MockApiClient(
            baseURL: "https://api.rawg.io/api",
            urlSession: URLSession.shared
        )
        
        gameService = GameServiceImpl(mockApiClient)
        
        try super.setUpWithError()
    }
 
    func testGetGamesSuccess() async throws {
        mockApiClient.shouldSucceed = true
        mockApiClient.expectedResponse = createGamesResponse()
        
        // Create a mock request
        let request = GamesRequest(
            page: randomInt,
            searchQuery: randomString(length: 5)
        )
        
        // Call the getGames method
        do {
            let response = try await gameService.getGames(request: request)
            
            // Assert the response or perform other validation
            XCTAssertNotNil(response)
            XCTAssertEqual(mockApiClient.expectedResponse, response)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testGetGamesFailure() async throws {
        mockApiClient.shouldSucceed = false
        
        // Create a mock request
        let request = GamesRequest(
            page: randomInt,
            searchQuery: randomString(length: 5)
        )
        
        // Call the getGames method
        do {
            let _ = try await gameService.getGames(request: request)
            
            // The test should fail if it reaches this point
            XCTFail("Expected error but got success response")
        } catch {
            // Assert the error or perform other validation
            XCTAssertEqual(error as? ApiError, ApiError.requestFailed)
        }
    }
    
}
