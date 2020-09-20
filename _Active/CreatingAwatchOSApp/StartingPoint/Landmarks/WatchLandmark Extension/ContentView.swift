//
//  ContentView.swift
//  WatchLandmark Extension
//
//  Created by David N. Huang on 9/19/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList { WatchLandmarkDetails(landmark: $0) }.environmentObject(UserData())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList { WatchLandmarkDetails(landmark: $0) }.environmentObject(UserData())
    }
}
