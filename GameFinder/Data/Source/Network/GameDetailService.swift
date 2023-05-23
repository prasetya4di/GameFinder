//
//  GameDetailService.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

protocol GameDetailService {
    func getGameDetail(request: GameDetailRequest) async throws -> GameDetailResponse
}

class GameDetailServiceImpl: GameDetailService {
    private let apiClient: ApiClient
    
    init(_ apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func getGameDetail(request: GameDetailRequest) async throws -> GameDetailResponse {
        return try await apiClient.get(
            withEndpoint: "/games",
            pathParams: request.pathParams,
            queryParams: request.queryParameters,
            responseType: GameDetailResponse.self
        )
    }
}
