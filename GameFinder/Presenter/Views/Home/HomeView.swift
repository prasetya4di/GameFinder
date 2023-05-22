//
//  HomeView.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            GameView()
                .tabItem {
                	Label("Home", systemImage: "house")
                }
            
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "heart")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
