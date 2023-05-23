//
//  GameExtensionMapper.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import CoreData
import Foundation

extension GameTable {
    func copy(withContext context: NSManagedObjectContext) -> GameTable {
        let gameTable = GameTable(context: context)
        
        gameTable.id = self.id
        gameTable.name = self.name
        gameTable.backgroundImage = self.backgroundImage
        gameTable.slug = self.slug
        gameTable.tba = self.tba
        gameTable.rating = self.rating
        gameTable.ratingTop = self.ratingTop
        gameTable.ratingsCount = self.ratingsCount
        gameTable.released = self.released
        
        return gameTable
    }
    
    static func from(game: Game) -> GameTable {
        let gameTable = GameTable()
        
        gameTable.id = Int32(game.id)
        gameTable.name = game.name
        gameTable.backgroundImage = game.backgroundImage
        gameTable.slug = game.slug
        gameTable.tba = game.tba
        gameTable.rating = game.rating
        gameTable.ratingTop = Int32(game.ratingTop)
        gameTable.ratingsCount = Int32(game.ratingsCount)
        gameTable.released = game.released
        
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
