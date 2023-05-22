//
//  GameViewResult.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

enum GameViewResult {
    case getGames(_ status: GetGamesStatus)
    case searchGames(_ status: SearchGamesStatus)
    case loadMore(_ status: LoadMoreStatus)
    
    enum GetGamesStatus {
        case loading
        case success(_ games: [Game])
        case error(_ err: Error)
    }
    
    enum SearchGamesStatus {
        case loading
        case success(_ games: [Game], searchQuery: String)
        case error(_ err: Error)
    }
    
    enum LoadMoreStatus {
        case loading
        case success(_ games: [Game])
        case error(_ err: Error)
    }
}
