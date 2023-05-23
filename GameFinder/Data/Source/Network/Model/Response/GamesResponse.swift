//
//  GamesResponse.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GamesResponse: Codable, Equatable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [GameResponse]
    
    static func == (lhs: GamesResponse, rhs: GamesResponse) -> Bool {
        return lhs.count == rhs.count
        && lhs.next == rhs.next
        && lhs.previous == rhs.previous
        && lhs.results == rhs.results
    }
    
}
