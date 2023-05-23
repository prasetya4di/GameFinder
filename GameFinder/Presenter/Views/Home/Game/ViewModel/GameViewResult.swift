//
//  GameViewResult.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

enum GameViewResult {
    case getGamesResult(_ status: GetGamesStatus)
    case searchGamesResult(_ status: SearchGamesStatus)
    case loadMoreResult(_ status: LoadMoreStatus)
    
    enum GetGamesStatus {
        case loading
        case success(_ games: [Game])
        case error(_ err: Error)
    }
    
    enum SearchGamesStatus {
        case loading
        case success(_ games: [Game], _ searchQuery: String)
        case error(_ err: Error)
    }
    
    enum LoadMoreStatus {
        case loading
        case success(_ games: [Game], _ nextPage: Int)
        case error(_ err: Error)
    }
}
