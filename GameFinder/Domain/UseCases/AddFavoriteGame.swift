//
//  AddFavoriteGame.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

protocol AddFavoriteGame {
    func call(_ game: Game)
}

class AddFavoriteGameImpl: AddFavoriteGame {
    private let repository: GameRepository
    
    init(_ repository: GameRepository) {
        self.repository = repository
    }
    
    func call(_ game: Game) {
        repository.addFavoriteGame(game)
    }
}
