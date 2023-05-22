//
//  GameRepositoryImpl.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

class GameRepositoryImpl: GameRepository {
    private let gameService: GameService
    
    init(_ gameService: GameService) {
        self.gameService = gameService
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
                released: gameResponse.released,
                tba: gameResponse.tba,
                backgroundImage: gameResponse.backgroundImage,
                rating: gameResponse.rating,
                ratingTop: gameResponse.ratingTop,
                ratingsCount: gameResponse.ratingsCount
            )
        }
    }
    
    func getGameDetail(id: Int) async throws -> GameDetail {
        let response = try await gameService.getGameDetail(
            request: GameDetailRequest(id: id)
        )
        
        return GameDetail(
            id: response.id,
            slug: response.slug,
            name: response.name,
            nameOriginal: response.nameOriginal,
            description: response.description,
            metacritic: response.metacritic,
            released: response.released,
            tba: response.tba,
            updated: response.updated,
            backgroundImage: response.backgroundImage,
            backgroundImageAdditional: response.backgroundImageAdditional,
            website: response.website,
            rating: response.rating,
            ratingTop: response.ratingTop,
            added: response.added,
            playtime: response.playtime,
            screenshotsCount: response.screenshotsCount,
            moviesCount: response.moviesCount,
            creatorsCount: response.creatorsCount,
            achievementsCount: response.achievementsCount,
            parentAchievementsCount: response.parentAchievementsCount,
            redditURL: response.redditURL,
            redditName: response.redditName,
            redditDescription: response.redditDescription,
            redditLogo: response.redditLogo,
            redditCount: response.redditCount,
            twitchCount: response.twitchCount,
            youtubeCount: response.youtubeCount,
            reviewsTextCount: response.reviewsTextCount,
            ratingsCount: response.ratingsCount,
            suggestionsCount: response.suggestionsCount,
            alternativeNames: response.alternativeNames,
            metacriticURL: response.metacriticURL,
            parentsCount: response.parentsCount,
            additionsCount: response.additionsCount,
            gameSeriesCount: response.gameSeriesCount,
            platforms: response.platforms.map {
                Platform(
                    platform: EsrbRating(
                        id: $0.platform.id,
                        slug: $0.platform.slug,
                        name: $0.platform.name
                    ),
                    releasedAt: $0.releasedAt,
                    requirements: Requirements(
                        minimum: $0.requirements.minimum,
                        recommended: $0.requirements.recommended
                    )
                )
            })
    }
}
