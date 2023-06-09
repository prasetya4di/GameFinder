//
//  GameViewState.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Foundation

struct GameViewState: Equatable {
    var isLoading = false
    var isSearching = false
    var isLoadMore = false
    var games: [Game] = []
    var searchQuery: String? = nil
    var page: Int = 1
    var error: Error? = nil
    
    static func idle() -> GameViewState {
        GameViewState()
    }
    
    static func == (lhs: GameViewState, rhs: GameViewState) -> Bool {
        return lhs.isLoading == rhs.isLoading
        && lhs.isSearching == rhs.isSearching
        && lhs.isLoadMore == rhs.isLoadMore
        && lhs.games == rhs.games
        && lhs.searchQuery == rhs.searchQuery
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
}
