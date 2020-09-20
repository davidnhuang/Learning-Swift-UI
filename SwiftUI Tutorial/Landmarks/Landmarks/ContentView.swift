//
//  ContentView.swift
//  Landmarks
//
//  Created by David N. Huang on 9/2/20.
//  Copyright © 2020 David N. Huang. All rights reserved.
//

import SwiftUI

// View
struct MainView: View {
    var body: some View {
        VStack {
            
            // MapView.swift
            MapView()
                .edgesIgnoringSafeArea(.top) //Extends pass safe area
                .frame(height: 300)
            
            // CircleView.swift
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // This View
            VStack (alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }
            .padding()
            Spacer()
        }
    }
}

// Provides preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
