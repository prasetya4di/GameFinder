//
//  MockCheckFavoriteGame.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Foundation
@testable import GameFinder

class MockCheckFavorite: CheckFavorite {
    var expectedFavorite = false
    var error: Error?
    
    func call(_ id: Int) throws -> Bool {
        if let error {
            throw error
        }
        
        return expectedFavorite
    }
}
