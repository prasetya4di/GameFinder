//
//  GameDetailViewState.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

struct GameDetailViewState: Equatable {
    var isLoading = false
    var detail: GameDetail? = nil
    var error: Error? = nil
    
    static func idle() -> GameDetailViewState {
        GameDetailViewState()
    }
    
    static func == (lhs: GameDetailViewState, rhs: GameDetailViewState) -> Bool {
        return lhs.isLoading == rhs.isLoading
        && lhs.detail?.id == rhs.detail?.id
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
}
