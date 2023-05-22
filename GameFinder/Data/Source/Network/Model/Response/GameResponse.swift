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
    let released: Date
    let tba: Bool
    let backgroundImage: String
    let rating: Int
    let ratingTop: Int
    let ratingsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case released
        case tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratingsCount = "rating_count"
    }
}
