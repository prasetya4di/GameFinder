//
//  MockAddFavoritegame.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Foundation
@testable import GameFinder

class MockAddFavoriteGame: AddFavoriteGame {
    var expectedGame: [Game] = []
    
    func call(_ game: GameFinder.Game) {
        expectedGame.append(game)
    }
}
