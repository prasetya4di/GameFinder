//
//  GameView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: GameViewModel
    
    var body: some View {
        VStack {
            if viewModel.viewState.isLoading {
                LoadingView()
            } else if let error = viewModel.viewState.error {
                ErrorView(message: error.localizedDescription)
            } else {
                ScrollView(showsIndicators: false) {
                    ListGameView(games: viewModel.viewState.games)
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.dispatch(.getGames)
        }
    }
}
