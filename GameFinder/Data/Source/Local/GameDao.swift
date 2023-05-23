//
//  GameDao.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import CoreData
import Foundation

protocol GameDao {
    func addFavoriteGame(_ game: GameTable)
    
    func getFavoriteGame() throws -> [GameTable]
    
    func isFavorite(_ id: Int) throws -> Bool
    
    func removeFavorite(_ id: Int) throws
}

class GameDaoImpl: GameDao {
    
    
    private let persistence: PersistenceController
    
    init(_ persistence: PersistenceController) {
        self.persistence = persistence
    }
    
    func addFavoriteGame(_ game: GameTable) {
        _ = game.copy(withContext: persistence.managedContext)
        persistence.saveContext()
    }
    
    func getFavoriteGame() throws -> [GameTable] {
        let fetchRequest: NSFetchRequest<GameTable> = GameTable.fetchRequest()
        
        let gameTableEntities = try persistence.managedContext.fetch(fetchRequest)
        
        return gameTableEntities
    }
    
    func isFavorite(_ id: Int) throws -> Bool {
        let fetchRequest: NSFetchRequest<GameTable> = GameTable.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        let gameTable = try persistence
            .managedContext
            .fetch(fetchRequest)
            .first
        
        return gameTable != nil
    }
    
    func removeFavorite(_ id: Int) throws {
        let fetchRequest: NSFetchRequest<GameTable> = GameTable.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        let gameTable = try persistence
            .managedContext
            .fetch(fetchRequest)
            .first
        
        if let gameTable {
            persistence.managedContext.delete(gameTable)
            persistence.saveContext()
        }
    }
}
