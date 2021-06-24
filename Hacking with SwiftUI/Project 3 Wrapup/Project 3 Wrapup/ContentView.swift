//
//  ContentView.swift
//  Project 3 Wrapup
//
//  Created by David N. Huang on 6/24/21.
//  Prompt:
//  1. Create a custom ViewModifier (and accompanying View extension) that makes a view have a large, blue font suitable for prominent titles in a view.
//  2. --Go back to project 1 and use a conditional modifier to change the total amount text view to red if the user selects a 0% tip.
//  3. --Go back to project 2 and create a FlagImage() view that renders one flag image using the specific set of modifiers we had.

import SwiftUI

struct CustomBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func customBlueTitleStyle() -> some View {
        self.modifier(CustomBlueTitle())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .customBlueTitleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
