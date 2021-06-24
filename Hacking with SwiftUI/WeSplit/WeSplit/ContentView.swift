//
//  ContentView.swift
//  WeSplit
//
//  Created by David N. Huang on 5/15/21.
//

import SwiftUI

// Manages text input and character limit
class textInputManager: ObservableObject {
    var charLimit = 8 // 8 digit limit
    
    @Published var inputValue = "" {
        didSet {
            if inputValue.count > charLimit {
                inputValue = String(inputValue.prefix(charLimit))
            }
        }
    }
}

struct ContentView: View {
        
    //@State private var checkAmount = "" // main input
    @ObservedObject private var checkAmount = textInputManager()
    @State private var numberOfPeople = 2 // ranges from 1 to 10
    @State private var tipPercentage = 2 // selects from array of percentages
    
    var givingTip: Bool {
        if tipPercentage == 4 {
            return false
        } else {
            return true
        }
    }
    
    let tipRanges = [10, 15, 20, 25, 0]
    
    var totalPerPerson: String {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipRanges[tipPercentage])
        
        let orderAmount = Double(checkAmount.inputValue) ?? 0
        
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
                    TextField("Amount", text: $checkAmount.inputValue)
                        .keyboardType(.decimalPad)
                        .foregroundColor(givingTip ? .black : .red)
                    Stepper("\(numberOfPeople) people split", value: $numberOfPeople, in: 1...10)
                        
                }
                
                Section(header: Text("Tip amount")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipRanges.count) {
                            Text("\(self.tipRanges[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
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
