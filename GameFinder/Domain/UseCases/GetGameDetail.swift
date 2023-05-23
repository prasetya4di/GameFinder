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
    private let repository: GameDetailRepository
    
    init(_ repository: GameDetailRepository) {
        self.repository = repository
    }
    
    func call(_ id: Int) async throws -> GameDetail {
        guard let result = try repository.getDetail(id) else {
            let response = try await repository.fetchDetail(id)
            repository.addDetail(response)
            return response
        }
        
        return result
    }
}
