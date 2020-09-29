//
//  CoreDataTodoApp.swift
//  CoreDataTodo
//
//  Created by David N. Huang on 9/28/20.
//

import SwiftUI

@main
struct CoreDataTodoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
