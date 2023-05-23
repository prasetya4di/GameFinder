//
//  GameDetailIntent.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

enum GameDetailIntent {
    case getDetail(_ id: Int)
    case addToFavorite(_ game: Game)
    case removeFromFavorite(_ id: Int)
}
