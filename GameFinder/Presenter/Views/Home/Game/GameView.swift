//
//  GameView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var viewModel: GameViewModel
    @State private var searchQuery = ""
    
    var body: some View {
        VStack {
            if viewModel.viewState.isLoading {
                LoadingView()
            } else if let error = viewModel.viewState.error {
                ErrorView(message: error.localizedDescription)
            } else {
                SearchTextField(
                    isDisabled: viewModel.viewState.isSearching,
                    text: $searchQuery
                ) {
                    viewModel.dispatch(.searchGames(searchQuery))
                }
                .padding(.bottom)
                
                if viewModel.viewState.isSearching {
                    LoadingView()
                } else if viewModel.viewState.games.isEmpty {
                    EmptyView()
                } else {
                    ScrollView(showsIndicators: false) {
                        ListGameView(games: viewModel.viewState.games) {
                            if !viewModel.viewState.isLoadMore {
                                viewModel.dispatch(
                                    .loadMore(
                                        viewModel.viewState.page + 1,
                                        viewModel.viewState.searchQuery
                                    )
                                )
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            if viewModel.viewState.games.isEmpty {
                viewModel.dispatch(.getGames)
            }
        }
    }
}
