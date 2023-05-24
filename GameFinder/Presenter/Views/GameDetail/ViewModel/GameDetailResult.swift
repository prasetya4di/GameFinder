//
//  GameDetailResult.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

enum GameDetailResult {
    case getDetailResult(_ status: GetDetailStatus)
    case addToFavoriteResult(_ status: AddToFavoriteStatus)
    case removeFromFavoriteResult(_ status: RemoveFromFavoriteStatus)
    case hideToastResult
    
    enum GetDetailStatus {
        case loading
        case success(_ game: GameDetail, _ isFavorited: Bool)
        case error(_ error: Error)
    }
    
    enum AddToFavoriteStatus {
        case loading
        case success
        case error(_ error: Error)
    }
    
    enum RemoveFromFavoriteStatus {
        case loading
        case success
        case error(_ error: Error)
    }
}
