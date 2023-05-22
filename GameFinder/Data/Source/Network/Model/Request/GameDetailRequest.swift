//
//  GameDetailRequest.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GameDetailRequest: Codable {
    private let apiKey: String
    let id: Int
    
    init(id: Int) {
        self.apiKey = RequestConstant.apiKey
        self.id = id
    }
    
    var queryParameters: [String: String] {
        ["key": apiKey]
    }
    
    var pathParams: [String: String] {
        ["id": String(id)]
    }
}
