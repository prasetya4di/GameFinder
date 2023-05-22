//
//  GamesRequest.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GamesRequest: Codable {
    private let apiKey: String
    private let page: Int
    private let pageSize: Int
    private let searchQuery: String?
    
    init(page: Int, searchQuery: String?) {
        self.apiKey = RequestConstant.apiKey
        self.page = page
        self.pageSize = RequestConstant.pageSize
        self.searchQuery = searchQuery
    }
    
    var queryParameters: [String: String] {
        var queryParameters: [String:String] = [
            "key": apiKey,
            "page": String(page),
            "page_size": String(pageSize),
        ]
        
        if let searchQuery {
            queryParameters["search"] = searchQuery
        }
        
        return queryParameters
    }
}
