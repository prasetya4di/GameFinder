//
//  ApiClient.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case requestFailed
    // Add more error cases as needed
}

class ApiClient {
    let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func get<T: Codable>(
        withEndpoint endpoint: String,
        pathParams: [String: String]? = nil,
        queryParams: [String: String]? = nil,
        responseType: T.Type
    ) async throws -> T {
        // Create the URL with endpoint, path parameters, and query parameters
        var urlComponents = URLComponents(string: "\(baseURL)\(endpoint)")!
        
        if let pathParams {
            let path = pathParams.map { key, value in
                "\(key)/\(value)"
            }.joined(separator: "/")
            
            urlComponents.path = "\(urlComponents.path)/\(path)"
        }
        
        if let queryParams {
            urlComponents.queryItems = queryParams.map { key, value in
                URLQueryItem(name: key, value: value)
            }
        }
        
        guard let url = urlComponents.url else {
            throw ApiError.invalidURL
        }
        
        // Create the URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        // Set other request headers if needed
        
        // Send the request and get the response data
        let (data, _) = try await URLSession.shared.data(for: request)
        
        // Parse the response data
        let decoder = JSONDecoder()
        let response = try! decoder.decode(T.self, from: data)
        
        return response
    }
}
