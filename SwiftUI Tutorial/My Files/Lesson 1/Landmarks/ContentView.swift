//
//  ContentView.swift
//  Landmarks
//
//  Created by David N. Huang on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            // Mapview
            MapView()
                .frame(height: 300)
                .ignoresSafeArea(edges: .top)
            
            // Thumbnail
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // Text label
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National park")
                    Spacer()
                    Text("California")
                }
            }.padding()
            
            // Flex spacer
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
