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
        self.apiKey = "b78a561ac7f74d6089de948f4fc78444"
        self.page = page
        self.pageSize = 20
        self.searchQuery = searchQuery
    }
}
