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
    
    func getFavoriteGames() throws -> [Game]
    
    func addFavoriteGame(_ game: Game)
    
    func removeFavorite(_ id: Int) throws
    
    func isFavorite(_ id: Int) throws -> Bool
}
