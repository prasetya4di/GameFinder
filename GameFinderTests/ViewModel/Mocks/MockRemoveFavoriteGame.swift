//
//  MockRemoveFavoriteGame.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Foundation
@testable import GameFinder

class MockRemoveFavoriteGame: RemoveFavoriteGame {
    var expectedGames: [Game] = []
    var error: Error?
    
    func call(_ id: Int) throws {
        if let error {
            throw error
        }
        
        expectedGames
            .removeAll { $0.id == id }
    }
}
