//
//  GameDao.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import CoreData
import Foundation

protocol GameDao {
    func addFavoriteGame(_ game: Game)
    
    func getFavoriteGame() throws -> [Game]
    
    func isFavorite(_ id: Int) throws -> Bool
    
    func removeFavorite(_ id: Int) throws
}

class GameDaoImpl: GameDao {
    
    private let persistence: PersistenceController
    
    init(_ persistence: PersistenceController) {
        self.persistence = persistence
    }
    
    func addFavoriteGame(_ game: Game) {
        _ = GameTable.from(game: game, withContext: persistence.managedContext)
        persistence.saveContext()
    }
    
    func getFavoriteGame() throws -> [Game] {
        let fetchRequest: NSFetchRequest<GameTable> = GameTable.fetchRequest()
        
        let gameTableEntities = try persistence.managedContext.fetch(fetchRequest)
        
        return gameTableEntities.map { gameTable in
            gameTable.toGame()
        }
    }
    
    func isFavorite(_ id: Int) throws -> Bool {
        let fetchRequest: NSFetchRequest<GameTable> = GameTable.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        let gameTable = try persistence
            .managedContext
            .fetch(fetchRequest)
            .first
        
        return gameTable != nil
    }
    
    func removeFavorite(_ id: Int) throws {
        let fetchRequest: NSFetchRequest<GameTable> = GameTable.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
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
