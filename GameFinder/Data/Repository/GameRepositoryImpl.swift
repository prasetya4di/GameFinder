//
//  GameRepositoryImpl.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

class GameRepositoryImpl: GameRepository {
    private let gameService: GameService
    private let gameDao: GameDao
    
    init(_ gameService: GameService, _ gameDao: GameDao) {
        self.gameService = gameService
        self.gameDao = gameDao
    }
    
    func getGames(page: Int, search: String?) async throws -> [Game] {
        let response = try await gameService.getGames(
            request: GamesRequest(
                page: page,
                searchQuery: search
            )
        )
        
        return response.results.map { gameResponse in
            Game(
                id: gameResponse.id,
                slug: gameResponse.slug,
                name: gameResponse.name,
                released: stringToDate(gameResponse.released),
                tba: gameResponse.tba,
                backgroundImage: gameResponse.backgroundImage,
                rating: gameResponse.rating,
                ratingTop: gameResponse.ratingTop,
                ratingsCount: gameResponse.ratingsCount
            )
        }
    }
    
    func getFavoriteGames() throws -> [Game] {
        return try gameDao
            .getFavoriteGame()
            .map { $0.toGame() }
    }
    
    func addFavoriteGame(_ game: Game) {
        gameDao.addFavoriteGame(game)
    }
    
    func removeFavorite(_ id: Int) throws {
        try gameDao.removeFavorite(id)
    }
    
    func isFavorite(_ id: Int) throws -> Bool {
        return try gameDao.isFavorite(id)
    }
    
    private func stringToDate(_ date: String?) -> Date? {
        guard let date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.date(from: date)
        return formattedDate
    }
}
