//
//  GameDetailResult.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

enum GameDetailResult {
    case getDetailResult(_ status: GetDetailStatus)
    
    enum GetDetailStatus {
        case loading
        case success(_ game: GameDetail)
        case error(_ error: Error)
    }
}
