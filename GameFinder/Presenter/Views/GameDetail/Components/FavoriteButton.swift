//
//  FavoriteButton.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct FavoriteButton: View {
    let isFavorite: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Image(
                systemName: isFavorite
                  ? "heart.fill"
                  : "heart"
            )
        }

    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isFavorite: true) { }
    }
}
