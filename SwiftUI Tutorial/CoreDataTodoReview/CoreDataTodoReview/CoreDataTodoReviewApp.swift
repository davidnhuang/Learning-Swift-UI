//
//  CoreDataTodoReviewApp.swift
//  CoreDataTodoReview
//
//  Created by David N. Huang on 10/25/20.
//

import SwiftUI

@main
struct CoreDataTodoReviewApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
