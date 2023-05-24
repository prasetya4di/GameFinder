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
                EmptyGameView()
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
        .toast(isPresented: showToast) {
            Text(
                viewModel.viewState.isFavorite
                ? "Added to Favorite"
                : "Removed from Favorite"
            )
        }
        .onAppear {
            viewModel.dispatch(.getDetail(game.id))
        }
    }
}

extension GameDetailView {
    private var showToast: Binding<Bool> {
        Binding<Bool> (
            get: {
                return viewModel.viewState.showToast
            },
            set: { _ in
                viewModel.dispatch(.hideToast)
            }
        )
    }
}
