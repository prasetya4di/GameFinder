//
//  ListGameView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct ListGameView: View {
    let games: [Game]
    let loadMore: () -> Void
    
    var body: some View {
        VStack {
            ForEach(games, id: \.id) { game in
                NavigationLink {
                    GameDetailView()
                } label: {
                    GameItemView(game: game)
                        .onAppear {
                            if let lastGame = games.last, lastGame == game {
                                loadMore()
                            }
                        }
                }

            }
            Spacer()
        }
    }
}

struct ListGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = Game(
            id: 0,
            slug: "slug",
            name: "Grand Theft Auto 5",
            released: Date.now,
            tba: true,
            backgroundImage: "https://media.rawg.io/media/games/8a0/8a02f84a5916ede2f923b88d5f8217ba.jpg",
            rating: 3,
            ratingTop: 3,
            ratingsCount: 3
        )
        
        ListGameView(
        	games: [
                game,
                game,
                game,
                game,
            	game,
            ]
        ) {}
    }
}
