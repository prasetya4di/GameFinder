//
//  GetFavoriteGames.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

protocol GetFavoriteGames {
    func call() throws -> [Game]
}

class GetFavoriteGamesImpl: GetFavoriteGames {
    private let repository: GameRepository
    
    init(_ repository: GameRepository) {
        self.repository = repository
    }
    
    func call() throws -> [Game] {
        return try repository.getFavoriteGames()
    }
}
