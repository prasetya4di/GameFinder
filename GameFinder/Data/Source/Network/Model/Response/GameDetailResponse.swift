//
//  GameDetailResponse.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

// MARK: - GameDetailResponse
struct GameDetailResponse: Codable {
    let id: Int
    let slug, name, nameOriginal, description: String
    let metacritic: Int
    let metacriticPlatforms: [MetacriticPlatform]
    let released: String
    let tba: Bool
    let updated: String
    let backgroundImage: String
    let backgroundImageAdditional: String
    let website: String
    let rating: Double
    let ratingTop: Int
    let ratings, reactions: AddedByStatus
    let added: Int
    let addedByStatus: AddedByStatus
    let playtime, screenshotsCount, moviesCount, creatorsCount: Int
    let achievementsCount: Int
    let parentAchievementsCount: Int
    let redditURL, redditName, redditDescription: String
    let redditLogo: String
    let redditCount: Int
    let twitchCount, youtubeCount, reviewsTextCount: String
    let ratingsCount, suggestionsCount: Int
    let alternativeNames: [String]
    let metacriticURL: String
    let parentsCount, additionsCount, gameSeriesCount: Int
    let esrbRating: EsrbRatingResponse
    let platforms: [PlatformResponse]
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name
        case nameOriginal = "name_original"
        case description, metacritic
        case metacriticPlatforms = "metacritic_platforms"
        case released, tba, updated
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website, rating
        case ratingTop = "rating_top"
        case ratings, reactions, added
        case addedByStatus = "added_by_status"
        case playtime
        case screenshotsCount = "screenshots_count"
        case moviesCount = "movies_count"
        case creatorsCount = "creators_count"
        case achievementsCount = "achievements_count"
        case parentAchievementsCount = "parent_achievements_count"
        case redditURL = "reddit_url"
        case redditName = "reddit_name"
        case redditDescription = "reddit_description"
        case redditLogo = "reddit_logo"
        case redditCount = "reddit_count"
        case twitchCount = "twitch_count"
        case youtubeCount = "youtube_count"
        case reviewsTextCount = "reviews_text_count"
        case ratingsCount = "ratings_count"
        case suggestionsCount = "suggestions_count"
        case alternativeNames = "alternative_names"
        case metacriticURL = "metacritic_url"
        case parentsCount = "parents_count"
        case additionsCount = "additions_count"
        case gameSeriesCount = "game_series_count"
        case esrbRating = "esrb_rating"
        case platforms
    }
}

// MARK: - AddedByStatus
struct AddedByStatus: Codable {
}

// MARK: - EsrbRating
struct EsrbRatingResponse: Codable {
    let id: Int
    let slug, name: String
}

// MARK: - MetacriticPlatform
struct MetacriticPlatform: Codable {
    let metascore: Int
    let url: String
}

// MARK: - Platform
struct PlatformResponse: Codable {
    let platform: EsrbRatingResponse
    let releasedAt: String
    let requirements: RequirementsResponse
    
    enum CodingKeys: String, CodingKey {
        case platform
        case releasedAt = "released_at"
        case requirements
    }
}

// MARK: - Requirements
struct RequirementsResponse: Codable {
    let minimum, recommended: String
}
