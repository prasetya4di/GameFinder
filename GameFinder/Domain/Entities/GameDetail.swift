//
//  GameDetail.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GameDetail {
    let id: Int
    let slug, name, nameOriginal, description: String
    let metacritic: Int
    let released: Date
    let tba: Bool
    let updated: Date
    let backgroundImage: String
    let backgroundImageAdditional: String
    let website: String
    let rating: Double
    let ratingTop: Int
    let added: Int
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int
    let achievementsCount: Int
    let parentAchievementsCount, redditURL, redditName, redditDescription: String
    let redditLogo: String
    let redditCount: Int
    let twitchCount, youtubeCount, reviewsTextCount: String
    let ratingsCount, suggestionsCount: Int
    let alternativeNames: [String]
    let metacriticURL: String
    let parentsCount, additionsCount, gameSeriesCount: Int
    let platforms: [Platform]
}

struct Platform {
    let platform: EsrbRating
    let releasedAt: String
    let requirements: Requirements
    
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
    let minimum, recommended: String
}
