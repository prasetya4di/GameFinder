//
//  CheckFavorite.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

protocol CheckFavorite {
    func call(_ id: Int) throws -> Bool
}

class CheckFavoriteImpl: CheckFavorite {
    private let repository: GameRepository
    
    init(_ repository: GameRepository) {
        self.repository = repository
    }
    
    func call(_ id: Int) throws -> Bool {
        return try repository.isFavorite(id)
    }
}
