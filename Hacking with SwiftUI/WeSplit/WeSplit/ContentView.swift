//
//  ContentView.swift
//  WeSplit
//
//  Created by David N. Huang on 5/15/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipRanges = [10, 15, 20, 25, 0]
    
    var totalPerPerson: String {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipRanges[tipPercentage])
        
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPer = grandTotal / peopleCount
        
        let finalDisplay = String(format: "%.2f", amountPer)
        
        return finalDisplay
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    Stepper("\(numberOfPeople) people split", value: $numberOfPeople, in: 1...10)
                }
                Section(header: Text("Tip amount")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipRanges.count) {
                            Text("\(self.tipRanges[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationTitle("$\(totalPerPerson)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
