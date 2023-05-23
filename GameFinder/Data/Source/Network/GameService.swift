//
//  GameService.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

protocol GameService {
    func getGames(request: GamesRequest) async throws -> GamesResponse
}

class GameServiceImpl: GameService {
    private let apiClient: ApiClient
    
    init(_ apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getGames(request: GamesRequest) async throws -> GamesResponse {
        return try await apiClient.get(
            withEndpoint: "/games",
            queryParams: request.queryParameters,
            responseType: GamesResponse.self
        )
    }
}
