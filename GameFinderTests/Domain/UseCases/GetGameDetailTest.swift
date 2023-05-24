//
//  GetGameDetailTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import XCTest
@testable import GameFinder

final class GetGameDetailTest: XCTestCase {
    
    private var mockGameDetailRepository: MockGameDetailRepository!
    private var getGameDetail: GetGameDetail!

    override func setUp() {
        mockGameDetailRepository = MockGameDetailRepository()
        getGameDetail = GetGameDetailImpl(mockGameDetailRepository)
    }
    
    func testGetGameDetailFromFetchSuccess() async throws {
        let expectedGameDetail = createGameDetail()
        mockGameDetailRepository.expectedGameDetail = expectedGameDetail
        
        let result = try await getGameDetail.call(randomInt)
        
        XCTAssertTrue(mockGameDetailRepository.isFetched)
        XCTAssertEqual(result, expectedGameDetail)
    }
    
    func testGetGameDetailFromLocalDatabaseSuccess() async throws {
        let expectedGameDetail = createGameDetail()
        mockGameDetailRepository.expectedGameDetail = expectedGameDetail
        
        let result = try await getGameDetail.call(expectedGameDetail.id)
        
        XCTAssertTrue(mockGameDetailRepository.isGet)
        XCTAssertEqual(result, expectedGameDetail)
    }
    
    func testGetGameDetailError() async throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockGameDetailRepository.error = expectedError
        
        do {
            _ = try await getGameDetail.call(randomInt)
            
            XCTFail("Search games should throw the error")
        } catch let exception {
            XCTAssertEqual(exception as? URLError, expectedError)
        }
    }
}
