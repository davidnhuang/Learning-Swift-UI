 //
//  ContentView.swift
//  SwiftUIDemo1
//
//  Created by David N. Huang on 8/19/20.
//  Copyright © 2020 David N. Huang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            // Map view
            MapView()
                .frame(height: 300)
                .edgesIgnoringSafeArea(.top)
            
            //Image view
            CircleImage()
                .offset(y:-130)
                .padding(.bottom, -130)
            
            // Text view
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
            }.padding()
            Spacer()
        }
    }
}

// Generates the preview in canvas - will never be built in production version
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Can modify this to see which view you want to preview
        ContentView()
    }
}
