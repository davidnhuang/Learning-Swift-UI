//
//  ContentView.swift
//  F to C
//
//  Created by David N. Huang on 5/16/21.
//

import SwiftUI

// Textfield manager
class textInputManager: ObservableObject {
    var charLimit = 15
    
    @Published var inputValue = "" {
        didSet {
            if inputValue.count > charLimit {
                inputValue = String(inputValue.prefix(charLimit))
            }
        }
    }
}

struct ContentView: View {
    
    @State private var startingUnitInput = textInputManager() // selecting unit type from an array
    @State private var targetConvertUnit = 0
    
    var unitTypes = ["C˚", "K", "F˚"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From")) {
                    TextField("F˚", text: $startingUnitInput.inputValue)
                    // Picker
                }
                Section(header: Text("To")) {
                    Picker("Unit", selection: $targetConvertUnit) {
                        ForEach(0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("Converted here")
                        .font(.body)
                        .fontWeight(.regular)
                }
            }
            .navigationTitle(Text("F˚→ \(unitTypes[0])"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
