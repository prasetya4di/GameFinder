//
//  FavoriteViewResult.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

enum FavoriteViewResult {
    case getFavoriteGamesResult(_ status: GetFavoriteGamesStatus)
    
    enum GetFavoriteGamesStatus {
        case loading
        case success(_ games: [Game])
        case error(_ error: Error)
    }
}
