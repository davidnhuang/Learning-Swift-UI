//
//  ContentView.swift
//  SpentPrototype
//
//  Created by David N. Huang on 7/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategory = 0
    
    let spendingCategories = ["Beverage", "Dining", "Groceries", "Utilities", "Shopping", "Services", "Transportation", "Entertainment", "Miscelaneous"]
    
    var body: some View {
        NavigationView {
            Text("Entry View")
            Button("Button") {
                NavigationLink(destination: SpendingType())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
