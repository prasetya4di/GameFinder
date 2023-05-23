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
        gameDetailTable.setValue("", forKey: "alternativeNames")
        gameDetailTable.setValue(detail.metacriticURL, forKey: "metacriticUrl")
        gameDetailTable.setValue(detail.parentsCount, forKey: "parentsCount")
        gameDetailTable.setValue(detail.additionsCount, forKey: "additionsCount")
        gameDetailTable.setValue(detail.gameSeriesCount, forKey: "gameSeriesCount")
        gameDetailTable.setValue("", forKey: "platforms")
        
        return gameDetailTable
    }
    
    func toGameDetail() -> GameDetail {
        return GameDetail(
            id: Int(self.id),
            slug: self.slug ?? "",
            name: self.name ?? "",
            nameOriginal: self.nameOriginal ?? "",
            description: self.description,
            metacritic: Int(self.metacritic),
            released: self.released,
            tba: self.tba,
            updated: self.updatedAt,
            backgroundImage: self.backgroundImage ?? "",
            backgroundImageAdditional:
                self.backgroundImageAdditional ?? "",
            website: self.website ?? "",
            rating: self.rating,
            ratingTop: Int(self.ratingTop),
            added: Int(self.added),
            playtime: Int(self.playtime),
            screenshotsCount: Int(self.screenshotsCount),
            moviesCount: Int(self.moviesCount),
            creatorsCount: Int(self.creatorsCount),
            achievementsCount: Int(self.achievementsCount),
            parentAchievementsCount: Int(self.parentAchievementsCount),
            redditURL: self.redditUrl ?? "",
            redditName: self.redditName ?? "",
            redditDescription: self.redditDescription ?? "",
            redditLogo: self.redditLogo ?? "",
            redditCount: Int(self.redditCount),
            twitchCount: Int(self.twitchCount),
            youtubeCount: Int(self.youtubeCount),
            reviewsTextCount: Int(self.reviewsTextCount),
            ratingsCount: Int(self.ratingsCount),
            suggestionsCount: Int(self.suggestionsCount),
            alternativeNames: [],
            metacriticURL: self.metacriticUrl ?? "",
            parentsCount: Int(self.parentsCount),
            additionsCount: Int(self.additionsCount),
            gameSeriesCount: Int(self.gameSeriesCount),
            platforms: [])
    }
}
