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

func createListGame() -> [GameResponse] {
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
        results: createListGame()
    )
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
