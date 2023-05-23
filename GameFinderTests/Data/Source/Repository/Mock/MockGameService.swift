//
//  MockGameService.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

class GameServiceMock: GameService {
    var expectedResponse: GamesResponse? = nil
    var error: Error? = nil
    
    func getGames(request: GamesRequest) async throws -> GamesResponse {
        if let error {
            throw error
        }
        
        return expectedResponse!
    }
}
