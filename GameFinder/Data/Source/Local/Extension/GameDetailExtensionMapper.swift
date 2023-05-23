//
//  GameDetailExtensionMapper.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import CoreData
import Foundation

extension GameDetailTable {
    func copy(withContext context: NSManagedObjectContext) -> GameDetailTable {
        let gameDetailTable = GameDetailTable(context: context)
        
        gameDetailTable.id = self.id
        gameDetailTable.slug = self.slug
        gameDetailTable.name = self.name
        gameDetailTable.nameOriginal = self.nameOriginal
        gameDetailTable.detailDescription = self.detailDescription
        gameDetailTable.metacritic = self.metacritic
        gameDetailTable.released = self.released
        gameDetailTable.tba = self.tba
        gameDetailTable.updatedAt = self.updatedAt
        gameDetailTable.backgroundImage = self.backgroundImage
        gameDetailTable.backgroundImageAdditional = self.backgroundImageAdditional
        gameDetailTable.website = self.website
        gameDetailTable.rating = self.rating
        gameDetailTable.ratingTop = self.ratingTop
        gameDetailTable.added = self.added
        gameDetailTable.playtime = self.playtime
        gameDetailTable.screenshotsCount = self.screenshotsCount
        gameDetailTable.moviesCount = self.moviesCount
        gameDetailTable.creatorsCount = self.creatorsCount
        gameDetailTable.achievementsCount = self.achievementsCount
        gameDetailTable.parentAchievementsCount = self.parentAchievementsCount
        gameDetailTable.redditUrl = self.redditUrl
        gameDetailTable.redditName = self.redditName
        gameDetailTable.redditDescription = self.redditDescription
        gameDetailTable.redditLogo = self.redditLogo
        gameDetailTable.redditCount = self.redditCount
        gameDetailTable.twitchCount = self.twitchCount
        gameDetailTable.youtubeCount = self.youtubeCount
        gameDetailTable.reviewsTextCount = self.reviewsTextCount
        gameDetailTable.ratingsCount = self.ratingsCount
        gameDetailTable.suggestionsCount = self.suggestionsCount
        gameDetailTable.alternativeNames = self.alternativeNames
        gameDetailTable.metacriticUrl = self.metacriticUrl
        gameDetailTable.parentsCount = self.parentsCount
        gameDetailTable.additionsCount = self.additionsCount
        gameDetailTable.gameSeriesCount = self.gameSeriesCount
        gameDetailTable.platforms = self.platforms
        
        return gameDetailTable
    }
}
