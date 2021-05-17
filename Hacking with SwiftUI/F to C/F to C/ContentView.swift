//
//  ContentView.swift
//  F to C
//
//  Created by David N. Huang on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startingUnitInput = "" // selecting unit type from an array
    
    var unitLabels = ["C˚", "F˚", "K"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert from")) {
                    TextField("Temperature in Fahrenheit", text: $startingUnitInput)
                    // Picker
                }
                Section(header: Text("To")) {
                    // Picker
                }
            }
            .navigationTitle(Text("F˚→ \(unitLabels[0])"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
