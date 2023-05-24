//
//  MocKGetGameDetail.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import Foundation
@testable import GameFinder

class MockGetGameDetail: GetGameDetail {
    var expectedGameDetail: GameDetail?
    var error: Error?
    
    func call(_ id: Int) async throws -> GameFinder.GameDetail {
        if let error {
            throw error
        }
        
        return expectedGameDetail!
    }
}
