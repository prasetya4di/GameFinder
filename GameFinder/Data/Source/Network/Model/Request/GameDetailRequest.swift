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
        self.apiKey = RequestConstant.apiKey.rawValue
        self.id = id
    }
    
    var asQueryParameter: [String: String] {
        ["key": apiKey]
    }
}
