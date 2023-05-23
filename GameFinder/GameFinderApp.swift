//
//  GameFinderApp.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

@main
struct GameFinderApp: App {
    @StateObject private var gameViewModel: GameViewModel
    @StateObject private var gameDetailViewModel: GameDetailViewModel
    @StateObject private var favoriteViewModel: FavoriteViewModel
    
    init() {
        let apiClient = ApiClient(baseURL: "https://api.rawg.io/api")
        let gameService: GameService = GameServiceImpl(apiClient)
        let gameDetailService: GameDetailService = GameDetailServiceImpl(apiClient)
        
        let persistence = PersistenceController.shared
        let gameDao: GameDao = GameDaoImpl(persistence)
        let gameDetailDao: GameDetailDao = GameDetailDaoImpl(persistence)
        
        let gameRepository: GameRepository =
        	GameRepositoryImpl(gameService, gameDao)
        let gameDetailRepository: GameDetailRepository =
        	GameDetailRepositoryImpl(gameDetailService, gameDetailDao)
        
        let getGames: GetGames = GetGamesImpl(gameRepository)
        let searchGames: SearchGames = SearchGamesImpl(gameRepository)
        let getGameDetail: GetGameDetail = GetGameDetailImpl(gameDetailRepository)
        let addFavoriteGame: AddFavoriteGame = AddFavoriteGameImpl(gameRepository)
        let removeFavoriteGame: RemoveFavoriteGame = RemoveFavoriteGameImpl(gameRepository)
        let checkFavorite: CheckFavorite = CheckFavoriteImpl(gameRepository)
        let getFavoriteGames: GetFavoriteGames = GetFavoriteGamesImpl(gameRepository)
        
        let gameViewModel = GameViewModel(getGames, searchGames)
        let gameDetailViewModel = GameDetailViewModel(
            getGameDetail,
            addFavoriteGame,
            removeFavoriteGame,
            checkFavorite
        )
        let favoriteViewModel = FavoriteViewModel(getFavoriteGames)
        
        self._gameViewModel = StateObject(wrappedValue: gameViewModel)
        self._gameDetailViewModel = StateObject(wrappedValue: gameDetailViewModel)
        self._favoriteViewModel = StateObject(wrappedValue: favoriteViewModel)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameViewModel)
                .environmentObject(gameDetailViewModel)
                .environmentObject(favoriteViewModel)
        }
    }
}
