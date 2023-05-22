//
//  GameRepository.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

protocol GameRepository {
    func getGames(page: Int, search: String?) async throws-> [Game]
    
    func getGameDetail(id: Int) async throws -> GameDetail
}
