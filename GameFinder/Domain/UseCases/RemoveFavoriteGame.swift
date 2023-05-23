//
//  RemoveFavoriteGame.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

protocol RemoveFavoriteGame {
    func call(_ id: Int) throws
}

class RemoveFavoriteGameImpl: RemoveFavoriteGame {
    private let repository: GameRepository
    
    init(_ repository: GameRepository) {
        self.repository = repository
    }
    
    func call(_ id: Int) throws {
        try repository.removeFavorite(id)
    }
}
