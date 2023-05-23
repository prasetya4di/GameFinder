//
//  GameRating.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct GameRating: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
            Text(String(format: "%.1f", rating))
                .bold()
                .foregroundColor(.gray)
        }
    }
}

struct GameRating_Previews: PreviewProvider {
    static var previews: some View {
        GameRating(rating: 4.55)
    }
}
