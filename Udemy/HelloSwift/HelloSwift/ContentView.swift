//
//  ContentView.swift
//  HelloSwift
//
//  Created by David N. Huang on 11/29/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello")
                .font(.largeTitle)
            Text("World")
                .font(.title3)
        }
        .foregroundColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
