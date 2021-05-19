//
//  ContentView.swift
//  Guess the Flag
//
//  Created by David N. Huang on 5/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.55, green: 0.8, blue: 0.25).ignoresSafeArea(.all)
            Text("Your content")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
