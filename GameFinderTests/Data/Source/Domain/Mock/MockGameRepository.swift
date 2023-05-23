//
//  MockGameRepository.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

class MockGameRepository: GameRepository {
    var expectedGames: [Game] = []
    var expectedFavoriteGames: [Game] = []
    var error: Error?
    
    func getGames(page: Int, search: String?) async throws -> [GameFinder.Game] {
        if let error {
            throw error
        }
        
        return expectedGames
    }
    
    func getFavoriteGames() throws -> [GameFinder.Game] {
        if let error {
            throw error
        }
        
        return expectedFavoriteGames
    }
    
    func addFavoriteGame(_ game: GameFinder.Game) {
        expectedGames.append(game)
    }
    
    func removeFavorite(_ id: Int) throws {
        if let error {
            throw error
        }
        
        expectedFavoriteGames.removeAll { game in
            game.id == id
        }
    }
    
    func isFavorite(_ id: Int) throws -> Bool {
        if let error {
            throw error
        }
        
        return expectedFavoriteGames.contains { game in
            game.id == id
        }
    }
}
