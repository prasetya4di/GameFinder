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
}
