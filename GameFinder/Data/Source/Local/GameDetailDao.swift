//
//  GameDetailDao.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import CoreData
import Foundation

protocol GameDetailDao {
    func addGameDetail(_ gameDetail: GameDetail)
    
    func getGameDetail(_ id: Int) throws -> GameDetailTable?
}

class GameDetailDaoImpl: GameDetailDao {
    private let persistence: PersistenceController
    
    init(_ persistence: PersistenceController) {
        self.persistence = persistence
    }
    
    func addGameDetail(_ gameDetail: GameDetail) {
        _ = GameDetailTable.from(
            detail: gameDetail,
            withContext: persistence.managedContext
        )
        persistence.saveContext()
    }
    
    func getGameDetail(_ id: Int) throws -> GameDetailTable? {
        let fetchRequest: NSFetchRequest<GameDetailTable> = GameDetailTable.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        let gameDetailTable = try persistence
            .managedContext
            .fetch(fetchRequest)
            .first
        
        return gameDetailTable
    }
}
