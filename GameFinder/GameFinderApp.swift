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
    
    init() {
        let apiClient = ApiClient(baseURL: "https://api.rawg.io/api")
        let gameService: GameService = GameServiceImpl(apiClient)
        
        let gameRepository: GameRepository = GameRepositoryImpl(gameService)
        
        let getGames: GetGames = GetGamesImpl(gameRepository)
        let searchGames: SearchGames = SearchGamesImpl(gameRepository)
        
        let gameViewModel = GameViewModel(getGames, searchGames)
        
        self._gameViewModel = StateObject(wrappedValue: gameViewModel)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(gameViewModel)
        }
    }
}
