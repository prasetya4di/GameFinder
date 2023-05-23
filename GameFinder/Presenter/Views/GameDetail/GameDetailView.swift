//
//  GameDetailView.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct GameDetailView: View {
    @EnvironmentObject var viewModel: GameDetailViewModel
    let game: Game
    
    var body: some View {
        VStack {
            if viewModel.viewState.isLoading {
                LoadingView()
            } else if let error = viewModel.viewState.error {
                ErrorView(message: error.localizedDescription)
            } else if let detail = viewModel.viewState.detail {
                DetailView(detail: detail)
            } else {
                EmptyView()
            }
        }
        .navigationTitle(viewModel.viewState.detail?.name ?? "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                FavoriteButton(isFavorite: viewModel.viewState.isFavorite) {
                    if viewModel.viewState.isFavorite {
                        viewModel.dispatch(.removeFromFavorite(game.id))
                    } else {
                        viewModel.dispatch(.addToFavorite(game))
                    }
                }
            }
        }
        .onAppear {
            viewModel.dispatch(.getDetail(game.id))
        }
    }
}
