//
//  SearchGames.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

protocol SearchGames {
    func call(page: Int, search: String) async throws -> [Game]
}

class SearchGamesImpl: SearchGames {
    private let repository: GameRepository
    
    init(_ repository: GameRepository) {
        self.repository = repository
    }
    
    func call(page: Int, search: String) async throws -> [Game] {
        return try await repository.getGames(
            page: page,
            search: search
        )
    }
}
