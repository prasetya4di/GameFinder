//
//  GameDetail.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GameDetail: Equatable {
    let id: Int
    let slug, name, nameOriginal, description: String
    let metacritic: Int
    let released: Date?
    let tba: Bool
    let updated: Date?
    let backgroundImage: String
    let backgroundImageAdditional: String
    let website: String
    let rating: Double
    let ratingTop: Int
    let added: Int
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int
    let achievementsCount: Int
    let parentAchievementsCount: Int
    let redditURL, redditName, redditDescription: String
    let redditLogo: String
    let redditCount: Int?
    let twitchCount, youtubeCount, reviewsTextCount, ratingsCount, suggestionsCount: Int?
    let alternativeNames: [String]
    let metacriticURL: String
    let parentsCount, additionsCount, gameSeriesCount: Int?
    let platforms: [Platform]
    
    static func == (lhs: GameDetail, rhs: GameDetail) -> Bool {
        return lhs.id == rhs.id &&
        lhs.slug == rhs.slug &&
        lhs.name == rhs.name &&
        lhs.nameOriginal == rhs.nameOriginal &&
        lhs.description == rhs.description &&
        lhs.metacritic == rhs.metacritic &&
        lhs.released == rhs.released &&
        lhs.tba == rhs.tba &&
        lhs.updated == rhs.updated &&
        lhs.backgroundImage == rhs.backgroundImage &&
        lhs.backgroundImageAdditional == rhs.backgroundImageAdditional &&
        lhs.website == rhs.website &&
        lhs.rating == rhs.rating &&
        lhs.ratingTop == rhs.ratingTop &&
        lhs.added == rhs.added &&
        lhs.playtime == rhs.playtime &&
        lhs.screenshotsCount == rhs.screenshotsCount &&
        lhs.moviesCount == rhs.moviesCount &&
        lhs.creatorsCount == rhs.creatorsCount &&
        lhs.achievementsCount == rhs.achievementsCount &&
        lhs.parentAchievementsCount == rhs.parentAchievementsCount &&
        lhs.redditURL == rhs.redditURL &&
        lhs.redditName == rhs.redditName &&
        lhs.redditDescription == rhs.redditDescription &&
        lhs.redditLogo == rhs.redditLogo &&
        lhs.redditCount == rhs.redditCount &&
        lhs.twitchCount == rhs.twitchCount &&
        lhs.youtubeCount == rhs.youtubeCount &&
        lhs.reviewsTextCount == rhs.reviewsTextCount &&
        lhs.ratingsCount == rhs.ratingsCount &&
        lhs.suggestionsCount == rhs.suggestionsCount &&
        lhs.alternativeNames == rhs.alternativeNames &&
        lhs.metacriticURL == rhs.metacriticURL &&
        lhs.parentsCount == rhs.parentsCount &&
        lhs.additionsCount == rhs.additionsCount &&
        lhs.gameSeriesCount == rhs.gameSeriesCount
    }
}

struct Platform {
    let platform: EsrbRating
    let releasedAt: String
    let requirements: Requirements?
    
    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirements
    }
}

struct EsrbRating: Codable {
    let id: Int
    let slug, name: String
}

struct Requirements {
    let minimum, recommended: String?
}
