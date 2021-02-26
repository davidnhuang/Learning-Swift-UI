//
//  PizzaRestaurantApp.swift
//  PizzaRestaurant
//
//  Created by David N. Huang on 12/29/20.
//

import SwiftUI

@main
struct PizzaRestaurantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
