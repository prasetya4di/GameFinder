//
//  GameExtensionMapper.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import CoreData
import Foundation

extension GameTable {
    static func from(
        game: Game,
        withContext context: NSManagedObjectContext
    ) -> GameTable {
        let gameTable = GameTable(context: context)
        
        gameTable.setValue(Int32(game.id), forKey: "id")
        gameTable.setValue(game.name, forKey: "name")
        gameTable.setValue(game.backgroundImage, forKey: "backgroundImage")
        gameTable.setValue(game.slug, forKey: "slug")
        gameTable.setValue(game.tba, forKey: "tba")
        gameTable.setValue(game.rating, forKey: "rating")
        gameTable.setValue(Int32(game.ratingTop), forKey: "ratingTop")
        gameTable.setValue(Int32(game.ratingsCount), forKey: "ratingsCount")
        gameTable.setValue(game.released, forKey: "released")
        
        return gameTable
    }
    
    func toGame() -> Game {
        return Game(
            id: Int(self.id),
            slug: self.slug!,
            name: self.name!,
            released: self.released,
            tba: self.tba,
            backgroundImage: self.backgroundImage,
            rating: self.rating,
            ratingTop: Int(self.ratingTop),
            ratingsCount: Int(self.ratingsCount)
        )
    }
}
