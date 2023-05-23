//
//  GameDetailView.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct GameDetailView: View {
    @EnvironmentObject var viewModel: GameDetailViewModel
    let id: Int
    
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
                FavoriteButton(isFavorite: false) { }
            }
        }
        .onAppear {
            viewModel.dispatch(.getDetail(id))
        }
    }
}
