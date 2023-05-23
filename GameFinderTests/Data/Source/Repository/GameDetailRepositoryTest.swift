//
//  GameDetailRepositoryTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
import XCTest
@testable import GameFinder

final class GameDetailRepositoryTest: XCTestCase {
    
    private var gameDetailService: MockGameDetailService!
    private var gameDetailDao: MockGameDetailDao!
    private var gameDetailRepository: GameDetailRepository!
    
    override func setUpWithError() throws {
        gameDetailService = MockGameDetailService()
        gameDetailDao = MockGameDetailDao()
        gameDetailRepository = GameDetailRepositoryImpl(
            gameDetailService,
            gameDetailDao
        )
        
        try super.setUpWithError()
    }
    
    func testAddGameDetail() throws {
        let expectedGameDetail = createGameDetail()
        
        gameDetailDao.addGameDetail(expectedGameDetail)
        
        XCTAssertTrue(gameDetailDao.gameDetail?.id == expectedGameDetail.id)
    }
    
    func testGetGameDetail() throws {
        let expectedGameDetail = createGameDetail()
        gameDetailDao.gameDetail = expectedGameDetail
        
        let result = try gameDetailDao.getGameDetail(expectedGameDetail.id)
        
        XCTAssertTrue(result?.id == expectedGameDetail.id)
    }
    
    func testGetGameDetail_ReturnNil() throws {
        let expectedGameDetail = createGameDetail()
        
        let result = try gameDetailDao.getGameDetail(expectedGameDetail.id)
        
       XCTAssertNil(result)
    }
    
    func testGetDetail_ExistingGameDetail_ReturnsGameDetail() async throws {
        let expectedGameDetailResponse = createGameDetailResponse()
        gameDetailService.expectedResponse = expectedGameDetailResponse
        
        // Act
        let retrievedGameDetail = try await gameDetailRepository.fetchDetail(expectedGameDetailResponse.id)
        
        // Assert
        XCTAssertEqual(retrievedGameDetail.id, expectedGameDetailResponse.id)
    }
    
    func testGetDetail_NonExistingGameDetail_ReturnsNil() throws {
        let nonExistingGameDetailID = 123 // Provide a non-existing game detail ID
        
        // Act
        let retrievedGameDetail = try gameDetailRepository.getDetail(nonExistingGameDetailID)
        
        // Assert
        XCTAssertNil(retrievedGameDetail)
    }
}
