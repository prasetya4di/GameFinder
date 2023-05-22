//
//  GameItemView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct GameItemView: View {
    let game: Game
    
    var body: some View {
        HStack(alignment: .top) {
            CachedNetworkImage(imageURL: game.backgroundImage ?? "")
                .frame(width: 180, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 8) {
                Text(game.name)
                    .bold()
                
                if let released = game.released {
                    GameReleaseDate(releaseDate: released)
                }
                
                GameRating(rating: game.rating)
            }
            
            Spacer()
        }
    }
}

struct GameItemView_Previews: PreviewProvider {
    static var previews: some View {
        GameItemView(
        	game: Game(
                id: 0,
                slug: "slug",
                name: "Grand Theft Auto 5",
                released: Date.now,
                tba: true,
                backgroundImage: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
                rating: 3,
                ratingTop: 3,
                ratingsCount: 3
            )
        )
    }
}
