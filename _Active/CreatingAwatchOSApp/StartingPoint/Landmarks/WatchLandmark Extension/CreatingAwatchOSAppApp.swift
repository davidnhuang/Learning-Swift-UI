//
//  CreatingAwatchOSAppApp.swift
//  WatchLandmark Extension
//
//  Created by David N. Huang on 9/19/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

@main
struct CreatingAwatchOSAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
