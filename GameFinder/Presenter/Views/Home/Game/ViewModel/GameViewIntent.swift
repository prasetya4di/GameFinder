//
//  GameViewIntent.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

enum GameViewIntent {
    case getGames
    case searchGames(_ searchQuery: String)
    case loadMore(_ nextPage: Int, _ searchQuery: String?)
}
