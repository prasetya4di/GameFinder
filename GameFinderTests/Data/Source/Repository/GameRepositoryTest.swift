//
//  GameRepositoryTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import XCTest
@testable import GameFinder

final class GameRepositoryTest: XCTestCase {

    private var gameServiceMock: GameServiceMock!
    private var gameDaoMock: GameDaoMock!
    private var gameRepository: GameRepository!
    
    override func setUpWithError() throws {
        gameServiceMock = GameServiceMock()
        gameDaoMock = GameDaoMock()
        gameRepository = GameRepositoryImpl(gameServiceMock, gameDaoMock)
        
        try super.setUpWithError()
    }
    
    func testGetGames() async throws {
        let expectedGameResponse = createGamesResponse()
        gameServiceMock.expectedResponse = expectedGameResponse
        
        // Act
        let games = try await gameRepository.getGames(page: 1, search: nil)
        
        // Assert
        XCTAssertEqual(games.count, expectedGameResponse.results.count)
        XCTAssertEqual(games.first?.id, expectedGameResponse.results.first?.id)
    }
    
    func testGetFavoriteGames() throws {
        let favoriteGame = createGame()
        gameDaoMock.favoriteGames = [favoriteGame]
        
        // Act
        let favoriteGames = try gameRepository.getFavoriteGames()
        
        // Assert
        XCTAssertEqual(favoriteGames.count, 1)
        XCTAssertEqual(favoriteGames.first, favoriteGame)
    }
    
    func testAddFavoriteGame() {
        let game = createGame()
        
        // Act
        gameRepository.addFavoriteGame(game)
        
        // Assert
        XCTAssertTrue(gameDaoMock.favoriteGames.contains(game))
    }
    
    func testRemoveFavorite() throws {
        let game = createGame()
        gameDaoMock.favoriteGames = [game]
        
        // Act
        try gameRepository.removeFavorite(game.id)
        
        // Assert
        XCTAssertFalse(gameDaoMock.favoriteGames.contains(game))
    }
    
    func testIsFavorite() throws {
        let game = createGame()
        gameDaoMock.favoriteGames = [game]
        
        // Act
        let isFavorite = try gameRepository.isFavorite(game.id)
        
        // Assert
        XCTAssertTrue(isFavorite)
    }
    
    func testGetGamesError() async throws {
        let expectedError = URLError(.unknown)
        gameServiceMock.error = expectedError
        
        do {
            let _ = try await gameRepository.getGames(page: 1, search: nil)
            
            XCTFail("Expected error but got success response")
        } catch let exception {
            XCTAssertEqual(exception as? URLError, expectedError)
        }
    }
}
