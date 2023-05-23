//
//  FavoriteViewState.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

struct FavoriteViewState: Equatable {
    var isLoading = false
    var games: [Game] = []
    var error: Error? = nil
    
    static func idle() -> FavoriteViewState {
        return FavoriteViewState()
    }
    
    static func == (lhs: FavoriteViewState, rhs: FavoriteViewState) -> Bool {
        return lhs.isLoading == rhs.isLoading
        && lhs.games == rhs.games
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
}
