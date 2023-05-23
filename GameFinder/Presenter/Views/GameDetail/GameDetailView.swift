//
//  GameDetailView.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct GameDetailView: View {
    var body: some View {
        VStack {
            Text("Game Detail")
            Spacer()
        }
        .navigationTitle("Grand Theft Auto 5")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                FavoriteButton(isFavorite: false) { }
            }
        }
    }
}

struct GameDetailView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailView()
    }
}
