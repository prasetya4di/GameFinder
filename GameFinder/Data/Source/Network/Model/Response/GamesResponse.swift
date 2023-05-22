//
//  GamesResponse.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GamesResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [GameResponse]
}
