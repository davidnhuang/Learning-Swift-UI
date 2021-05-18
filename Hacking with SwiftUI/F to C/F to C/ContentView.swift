//
//  ContentView.swift
//  F to C
//
//  Created by David N. Huang on 5/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var Fahrenheit = "0.0"
    @State private var selectedUnit = 0
    
    var unitLabels = ["˚C", "K", "˚F"]
    
    var conversion: String {
        
        let inputValue = Float(Fahrenheit) ?? 0
        let Celsius = (inputValue-32)/1.8
        let Kelvin = Celsius + 273.5
        
        let conversions = [Celsius, Kelvin, inputValue]
        
        let ouput = String(conversions[selectedUnit])
        
        return ouput
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From")) {
                    TextField("F˚", text: $Fahrenheit)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("To")) {
                    Picker("Unit", selection: $selectedUnit) {
                        ForEach(0 ..< unitLabels.count) {
                            Text("\(self.unitLabels[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text(conversion+" "+unitLabels[selectedUnit])
                }
            }
            .navigationTitle(Text("˚F →"+unitLabels[selectedUnit]))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
