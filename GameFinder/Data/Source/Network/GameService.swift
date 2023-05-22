//
//  GameService.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

protocol GameService {
    func getGames(request: GamesRequest) async throws -> GamesResponse
    
    func getGameDetail(request: GameDetailRequest) async throws -> GameDetailResponse
}

class GameServiceImpl: GameService {
    private let apiClient: ApiClient
    
    init(_ apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getGames(request: GamesRequest) async throws -> GamesResponse {
        return try await apiClient.get(
            withEndpoint: "",
            queryParams: request.queryParameters,
            responseType: GamesResponse.self
        )
    }
    
    func getGameDetail(request: GameDetailRequest) async throws -> GameDetailResponse {
        return try await apiClient.get(
            withEndpoint: "",
            pathParams: request.pathParams,
            queryParams: request.queryParameters,
            responseType: GameDetailResponse.self
        )
    }
}
