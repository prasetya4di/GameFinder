//
//  DetailView.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import SwiftUI

struct DetailView: View {
    let detail: GameDetail
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CachedNetworkImage(imageURL: detail.backgroundImage)
            
            VStack(alignment: .leading, spacing: 6) {
                DetailTitle(title: detail.name)
                
                if let released = detail.released {
                    GameReleaseDate(releaseDate: released)
                }
                
                HStack(spacing: 14) {
                    GameRating(rating: detail.rating)
                    PlaytimeText(playtime: detail.playtime)
                    Spacer()
                }
                .font(.caption)
                
                DetailDescription(description: detail.description)
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(
        	detail: GameDetail(
                id: 3498,
                slug: "grand-theft-auto-5",
                name: "Grand Theft Auto 5",
                nameOriginal: "Grand Theft Auto V",
                description: "Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. \nSimultaneous storytelling from three unique perspectives: \nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. \nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.\n\nEspañol\nRockstar Games se hizo más grande desde su entrega anterior de la serie. Obtienes la construcción del mundo complicada y realista de Liberty City de GTA4 en el escenario de Los Santos, un viejo favorito de los fans, GTA San Andreas. 561 vehículos diferentes (incluidos todos los transportes que puede operar) y la cantidad aumenta con cada actualización.\nNarración simultánea desde tres perspectivas únicas:\nSigue a Michael, ex-criminal que vive su vida de ocio lejos del pasado, Franklin, un niño que busca un futuro mejor, y Trevor, el pasado exacto del que Michael está tratando de huir.\nGTA Online proporcionará muchos desafíos adicionales incluso para los jugadores experimentados, recién llegados del modo historia. Ahora tendrás otros jugadores cerca que pueden ayudarte con la misma probabilidad que arruinar tu misión. Los jugadores pueden experimentar todas las mecánicas de GTA actualizadas a través del personaje personalizable único, y el contenido de la comunidad combinado con el sistema de nivelación tiende a mantener a todos ocupados y comprometidos.",
                metacritic: 92,
                released: .now,
                tba: false,
                updated: .now,
                backgroundImage: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
                backgroundImageAdditional: "https://media.rawg.io/media/screenshots/5f5/5f5a38a222252d996b18962806eed707.jpg",
                website: "http://www.rockstargames.com/V/",
                rating: 4.47,
                ratingTop: 5,
                added: 0,
                playtime: 73,
                screenshotsCount: 57,
                moviesCount: 8,
                creatorsCount: 11,
                achievementsCount: 539,
                parentAchievementsCount: 75,
                redditURL: "",
                redditName: "",
                redditDescription: "",
                redditLogo: "",
                redditCount: 0,
                twitchCount: "",
                youtubeCount: "",
                reviewsTextCount: "",
                ratingsCount: 0,
                suggestionsCount: 0,
                alternativeNames: [],
                metacriticURL: "",
                parentsCount: 0,
                additionsCount: 3,
                gameSeriesCount: 9,
                platforms: []
            )
        )
    }
}
