//
//  MockGetFavoriteGames.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Foundation
@testable import GameFinder

class MockGetFavoriteGames: GetFavoriteGames {
    var expectedGames: [Game] = []
    var error: Error?
    
    func call() throws -> [GameFinder.Game] {
        if let error {
            throw error
        }
        
        return expectedGames
    }
}
