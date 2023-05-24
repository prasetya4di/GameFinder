//
//  MockGameDetailDao.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

class MockGameDetailDao: GameDetailDao {
    var gameDetail: GameDetail?
    
    func addGameDetail(_ gameDetail: GameFinder.GameDetail) {
        self.gameDetail = gameDetail
    }
    
    func getGameDetail(_ id: Int) throws -> GameFinder.GameDetail? {
        return self.gameDetail?.id == id ? gameDetail : nil
    }
}
