//
//  MockGameDetailRepository.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

class MockGameDetailRepository: GameDetailRepository {
    var expectedGameDetail: GameDetail?
    var error: Error?
    
    func fetchDetail(_ id: Int) async throws -> GameFinder.GameDetail {
        if let error {
            throw error
        }
        
        return expectedGameDetail!
    }
    
    func getDetail(_ id: Int) throws -> GameFinder.GameDetail? {
        if let error {
            throw error
        }
        
        return expectedGameDetail?.id == id
        	? expectedGameDetail
        	: nil
    }
    
    func addDetail(_ detail: GameFinder.GameDetail) {
        expectedGameDetail = detail
    }
}
