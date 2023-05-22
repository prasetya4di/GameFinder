//
//  GetGames.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

protocol GetGames {
    func call(page: Int) async throws -> [Game]
}

class GetGamesImpl: GetGames {
    private let repository: GameRepository
    
    init(_ repository: GameRepository) {
        self.repository = repository
    }
    
    func call(page: Int) async throws -> [Game] {
        return try await repository.getGames(
            page: page,
            search: nil
        )
    }
}
