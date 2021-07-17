//
//  ContentView.swift
//  SpentPrototype
//
//  Created by David N. Huang on 7/16/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCategory = 0
    @State private var entry = 0
    
    let spendingCategories = ["Beverage", "Dining", "Groceries", "Utilities", "Shopping", "Services", "Transportation", "Entertainment", "Miscelaneous"]
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    
    // TODO - investigate LazyVStack in a scroll view
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea(.all)
            VStack {
                Text("Select a category")
                    .padding(.top)
                    .foregroundColor(.white)
                Spacer()
                List {
                    ForEach(0 ..< spendingCategories.count) {
                        Text(spendingCategories[$0])
                    }
                    .foregroundColor(.white)
                    .listRowBackground(Color.clear)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
