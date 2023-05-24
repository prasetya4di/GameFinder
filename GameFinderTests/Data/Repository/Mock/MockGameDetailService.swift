//
//  MockGameDetailService.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

class MockGameDetailService: GameDetailService {
    var expectedResponse: GameDetailResponse?
    var error: Error?
    
    func getGameDetail(request: GameFinder.GameDetailRequest) async throws -> GameFinder.GameDetailResponse {
        if let error {
            throw error
        }
        
        return expectedResponse!
    }
}
