//
//  ContentView.swift
//  Project 3
//
//  Created by David N. Huang on 6/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .frame(maxWidth: 200, maxHeight: 200)
                .padding()
                .background(Color.blue)
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
