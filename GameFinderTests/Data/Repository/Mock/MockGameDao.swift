//
//  MockGameDao.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

class GameDaoMock: GameDao {
    var favoriteGames: [Game] = []
    
    func getFavoriteGame() throws -> [Game] {
        return favoriteGames
    }
    
    func addFavoriteGame(_ game: Game) {
        favoriteGames.append(game)
    }
    
    func removeFavorite(_ id: Int) {
        favoriteGames.removeAll { $0.id == id }
    }
    
    func isFavorite(_ id: Int) -> Bool {
        return favoriteGames.contains { $0.id == id }
    }
}
