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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
