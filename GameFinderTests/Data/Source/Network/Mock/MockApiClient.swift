//
//  MockApiClient.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

class MockApiClient<V>: ApiClient {
    var shouldSucceed: Bool = true
    var expectedResponse: V? = nil
    
    override func get<T: Codable>(
        withEndpoint endpoint: String,
        pathParams: [String: String]? = nil,
        queryParams: [String: String]? = nil,
        responseType: T.Type
    ) async throws -> T {
        if shouldSucceed {
            return expectedResponse as! T
        } else {
            // Throw a mock error
            throw ApiError.requestFailed
        }
    }
}
