//
//  SwiftUI_MidtermApp.swift
//  SwiftUI Midterm
//
//  Created by David N. Huang on 1/9/21.
//

import SwiftUI

@main
struct SwiftUI_MidtermApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext) //environment is where system wide settings are saved
        }
    }
}
