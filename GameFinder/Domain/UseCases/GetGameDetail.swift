//
//  GetGameDetail.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

protocol GetGameDetail {
    func call(_ id: Int) async throws -> GameDetail
}

class GetGameDetailImpl: GetGameDetail {
    private let repository: GameRepository
    
    init(_ repository: GameRepository) {
        self.repository = repository
    }
    
    func call(_ id: Int) async throws -> GameDetail {
        return try await repository.getGameDetail(id: id)
    }
}
