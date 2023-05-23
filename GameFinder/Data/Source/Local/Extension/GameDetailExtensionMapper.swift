//
//  GameDetailExtensionMapper.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import CoreData
import Foundation

extension GameDetailTable {
    static func from(
        detail: GameDetail,
        withContext context: NSManagedObjectContext
    ) -> GameDetailTable {
        let gameDetailTable = GameDetailTable(context: context)
        
        gameDetailTable.setValue(detail.id, forKey: "id")
        gameDetailTable.setValue(detail.slug, forKey: "slug")
        gameDetailTable.setValue(detail.name, forKey: "name")
        gameDetailTable.setValue(detail.nameOriginal, forKey: "nameOriginal")
        gameDetailTable.setValue(detail.description, forKey: "detailDescription")
        gameDetailTable.setValue(detail.metacritic, forKey: "metacritic")
        gameDetailTable.setValue(detail.released, forKey: "released")
        gameDetailTable.setValue(detail.tba, forKey: "tba")
        gameDetailTable.setValue(detail.updated, forKey: "updatedAt")
        gameDetailTable.setValue(detail.backgroundImage, forKey: "backgroundImage")
        gameDetailTable.setValue(detail.backgroundImageAdditional, forKey: "backgroundImageAdditional")
        gameDetailTable.setValue(detail.website, forKey: "website")
        gameDetailTable.setValue(detail.rating, forKey: "rating")
        gameDetailTable.setValue(detail.ratingTop, forKey: "ratingTop")
        gameDetailTable.setValue(detail.added, forKey: "added")
        gameDetailTable.setValue(detail.playtime, forKey: "playtime")
        gameDetailTable.setValue(detail.screenshotsCount, forKey: "screenshotsCount")
        gameDetailTable.setValue(detail.moviesCount, forKey: "moviesCount")
        gameDetailTable.setValue(detail.creatorsCount, forKey: "creatorsCount")
        gameDetailTable.setValue(detail.achievementsCount, forKey: "achievementsCount")
        gameDetailTable.setValue(detail.parentAchievementsCount, forKey: "parentAchievementsCount")
        gameDetailTable.setValue(detail.redditURL, forKey: "redditUrl")
        gameDetailTable.setValue(detail.redditName, forKey: "redditName")
        gameDetailTable.setValue(detail.redditDescription, forKey: "redditDescription")
        gameDetailTable.setValue(detail.redditLogo, forKey: "redditLogo")
        gameDetailTable.setValue(detail.redditCount, forKey: "redditCount")
        gameDetailTable.setValue(detail.twitchCount, forKey: "twitchCount")
        gameDetailTable.setValue(detail.youtubeCount, forKey: "youtubeCount")
        gameDetailTable.setValue(detail.reviewsTextCount, forKey: "reviewsTextCount")
        gameDetailTable.setValue(detail.ratingsCount, forKey: "ratingsCount")
        gameDetailTable.setValue(detail.suggestionsCount, forKey: "suggestionsCount")
        gameDetailTable.setValue(detail.alternativeNames, forKey: "alternativeNames")
        gameDetailTable.setValue(detail.metacriticURL, forKey: "metacriticUrl")
        gameDetailTable.setValue(detail.parentsCount, forKey: "parentsCount")
        gameDetailTable.setValue(detail.additionsCount, forKey: "additionsCount")
        gameDetailTable.setValue(detail.gameSeriesCount, forKey: "gameSeriesCount")
        gameDetailTable.setValue(detail.platforms, forKey: "platforms")

        
        return gameDetailTable
    }
}
