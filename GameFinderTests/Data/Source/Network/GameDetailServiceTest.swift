//
//  GameDetailServiceTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import XCTest
@testable import GameFinder

final class GameDetailServiceTest: XCTestCase {

    var mockApiClient: MockApiClient<GameDetailResponse>!
    var gameDetailService: GameDetailService!
    
    override func setUpWithError() throws {
        mockApiClient = MockApiClient(
            baseURL: "https://api.rawg.io/api",
            urlSession: URLSession.shared
        )
        
        gameDetailService = GameDetailServiceImpl(mockApiClient)
        
        try super.setUpWithError()
    }

    func testGetGameDetailSuccess() async throws {
        mockApiClient.shouldSucceed = true
        mockApiClient.expectedResponse = createGameDetailResponse()
        
        // Create a mock request
        let request = GameDetailRequest(id: randomInt)
        
        // Call the getGameDetail method
        do {
            let response = try await gameDetailService.getGameDetail(request: request)
            
            // Assert the response or perform other validation
            XCTAssertNotNil(response)
            XCTAssertEqual(mockApiClient.expectedResponse, response)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testGetGameDetailFailure() async throws {
        mockApiClient.shouldSucceed = false
        
        // Create a mock request
        let request = GameDetailRequest(id: randomInt)
        
        // Call the getGameDetail method
        do {
            let _ = try await gameDetailService.getGameDetail(request: request)
            
            // The test should fail if it reaches this point
            XCTFail("Expected error but got success response")
        } catch {
            // Assert the error or perform other validation
            XCTAssertEqual(error as? ApiError, ApiError.requestFailed)
        }
    }
}
