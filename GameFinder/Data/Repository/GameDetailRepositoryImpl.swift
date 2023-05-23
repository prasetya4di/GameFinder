//
//  GameDetailRepositoryImpl.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

class GameDetailRepositoryImpl: GameDetailRepository {
    private let gameDetailService: GameDetailService
    private let gameDetailDao: GameDetailDao
    
    init(
        _ gameDetailService: GameDetailService,
        _ gameDetailDao: GameDetailDao
    ) {
        self.gameDetailService = gameDetailService
        self.gameDetailDao = gameDetailDao
    }
    
    func addDetail(_ detail: GameDetail) {
        gameDetailDao.addGameDetail(detail)
    }
    
    func getDetail(_ id: Int) throws -> GameDetail? {
        return try gameDetailDao.getGameDetail(id)
    }
    
    func fetchDetail(_ id: Int) async throws -> GameDetail {
        let response = try await gameDetailService.getGameDetail(
            request: GameDetailRequest(id: id)
        )
        
        return GameDetail(
            id: response.id,
            slug: response.slug,
            name: response.name,
            nameOriginal: response.nameOriginal,
            description: response.description,
            metacritic: response.metacritic,
            released: stringToDate(response.released),
            tba: response.tba,
            updated: stringToDate(response.updated),
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
            }
        )
    }
    
    private func stringToDate(_ date: String?) -> Date? {
        guard let date else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.date(from: date)
        return formattedDate
    }
}
