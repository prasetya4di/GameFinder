//
//  GameResponse.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GameResponse: Codable {
    let id: Int
    let slug: String
    let name: String
    let released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Int
    let ratingTop: Int
    let ratingsCount: Int
}
