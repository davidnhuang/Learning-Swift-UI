//
//  SpentApp.swift
//  Spent
//
//  Created by David N. Huang on 7/16/21.
//

import SwiftUI

@main
struct SpentApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
