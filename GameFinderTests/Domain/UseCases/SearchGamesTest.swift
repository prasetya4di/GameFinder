//
//  SearchGamesTest.swift
//  GameFinderTests
//
//  Created by Prasetya on 24/05/23.
//

import XCTest
@testable import GameFinder

final class SearchGamesTest: XCTestCase {

    private var mockGameRepository: MockGameRepository!
    private var searchGames: SearchGames!
    
    override func setUp() {
        mockGameRepository = MockGameRepository()
        searchGames = SearchGamesImpl(mockGameRepository)
    }
    
    func testSearchGamesSuccess() async throws {
        let expectedGames = createListGame()
        let searchQuery = randomString(length: 5)
        mockGameRepository.expectedGames = expectedGames
        
        let result = try await searchGames.call(
            page: 1,
            search: searchQuery
        )
        
        XCTAssertEqual(result, expectedGames)
    }
    
    func testSearchGamesError() async throws {
        let expectedError = URLError(URLError.badServerResponse)
        mockGameRepository.error = expectedError
        let searchQuery = randomString(length: 5)
        
        do {
            _ = try await searchGames.call(
                page: 1,
                search: searchQuery
            )
            
            XCTFail("Search games should throw the error")
        } catch let exception {
            XCTAssertEqual(exception as? URLError, expectedError)
        }
    }
}
