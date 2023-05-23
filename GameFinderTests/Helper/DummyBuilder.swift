//
//  DummyBuilder.swift
//  GameFinderTests
//
//  Created by Prasetya on 23/05/23.
//

import Foundation
@testable import GameFinder

func createGameResponse() -> GameResponse {
    return GameResponse(
        id: randomInt,
        slug: randomString(length: 5),
        name: randomString(length: 5),
        released: randomString(length: 5),
        tba: randomBool,
        backgroundImage: randomString(length: 5),
        rating: randomDouble(from: 0, to: 5),
        ratingTop: randomInt,
        ratingsCount: randomInt
    )
}

func createListGameResponse() -> [GameResponse] {
    return [
    	createGameResponse(),
        createGameResponse(),
        createGameResponse(),
        createGameResponse()
    ]
}

func createGamesResponse() -> GamesResponse {
    return GamesResponse(
        count: randomInt,
        next: randomString(length: 5),
        previous: randomString(length: 5),
        results: createListGameResponse()
    )
}

func createGameDetailResponse() -> GameDetailResponse {
    return GameDetailResponse(
        id: randomInt,
        slug: randomString(length: 5),
        name: randomString(length: 5),
        nameOriginal: randomString(length: 5),
        description: randomString(length: 5),
        metacritic: randomInt,
        metacriticPlatforms: [],
        released: randomString(length: 5),
        tba: randomBool,
        updated: randomString(length: 5),
        backgroundImage: randomString(length: 5),
        backgroundImageAdditional: randomString(length: 5),
        website: randomString(length: 5),
        rating: randomDouble(from: 0, to: 5),
        ratingTop: 5,
        ratings: AddedByStatus(),
        reactions: AddedByStatus(),
        added: randomInt,
        addedByStatus: AddedByStatus(),
        playtime: randomInt,
        screenshotsCount: randomInt,
        moviesCount: randomInt,
        creatorsCount: randomInt,
        achievementsCount: randomInt,
        parentAchievementsCount: randomInt,
        redditURL: randomString(length: 5),
        redditName: randomString(length: 5),
        redditDescription: randomString(length: 5),
        redditLogo: randomString(length: 5),
        redditCount: randomInt,
        twitchCount: randomInt,
        youtubeCount: randomInt,
        reviewsTextCount: randomInt,
        ratingsCount: randomInt,
        suggestionsCount: randomInt,
        alternativeNames: [],
        metacriticURL: randomString(length: 5),
        parentsCount: randomInt,
        additionsCount: randomInt,
        gameSeriesCount: randomInt,
        esrbRating: EsrbRatingResponse(
            id: randomInt,
            slug: randomString(length: 5),
            name: randomString(length: 5)
        ),
        platforms: [])
}

func createGame() -> Game {
    return Game(
        id: randomInt,
        slug: randomString(length: 5),
        name: randomString(length: 5),
        released: .now,
        tba: randomBool,
        backgroundImage: randomString(length: 5),
        rating: randomDouble(from: 0, to: 5),
        ratingTop: randomInt,
        ratingsCount: randomInt
    )
}

func createListGame() -> [Game] {
    return [
    	createGame(),
        createGame(),
        createGame(),
        createGame()
    ]
}

var randomInt: Int {
    Int(arc4random_uniform(UInt32(100)))
}

var randomBool: Bool {
    arc4random_uniform(2) == 0
}

func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map { _ in letters.randomElement()! })
}

func randomDouble(from minValue: Double, to maxValue: Double) -> Double {
    return Double.random(in: minValue...maxValue)
}
