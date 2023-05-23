//
//  GameFinderApp.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

@main
struct GameFinderApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var gameViewModel: GameViewModel
    @StateObject private var gameDetailViewModel: GameDetailViewModel
    
    init() {
        let apiClient = ApiClient(baseURL: "https://api.rawg.io/api")
        let gameService: GameService = GameServiceImpl(apiClient)
        
        let persistence = PersistenceController.shared
        let gameDao: GameDao = GameDaoImpl(persistence)
        
        let gameRepository: GameRepository =
        	GameRepositoryImpl(gameService, gameDao)
        
        let getGames: GetGames = GetGamesImpl(gameRepository)
        let searchGames: SearchGames = SearchGamesImpl(gameRepository)
        let getGameDetail: GetGameDetail = GetGameDetailImpl(gameRepository)
        
        let gameViewModel = GameViewModel(getGames, searchGames)
        let gameDetailViewModel = GameDetailViewModel(getGameDetail)
        
        self._gameViewModel = StateObject(wrappedValue: gameViewModel)
        self._gameDetailViewModel = StateObject(wrappedValue: gameDetailViewModel)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(gameViewModel)
                .environmentObject(gameDetailViewModel)
        }
    }
}
