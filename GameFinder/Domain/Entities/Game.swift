//
//  Game.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct Game: Equatable {
    let id: Int
    let slug: String
    let name: String
    let released: Date?
    let tba: Bool
    let backgroundImage: String?
    let rating: Double
    let ratingTop: Int
    let ratingsCount: Int
}
