//
//  MockSearchGames.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Foundation
@testable import GameFinder

class MockSearchGames: SearchGames {
    var expectedGames: [Game] = []
    var error: Error?
    
    func call(page: Int, search: String) async throws -> [GameFinder.Game] {
        if let error {
            throw error
        }
        
        return expectedGames
    }
}
