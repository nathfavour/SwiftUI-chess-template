//
//  chessgameApp.swift
//  chessgame
//
//  Created by Analyst  on 7/2/23.
//

import SwiftUI

@main
struct chessgameApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}



