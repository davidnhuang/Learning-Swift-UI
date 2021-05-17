//
//  ContentView.swift
//  Text Input Manager
//
//  Created by David N. Huang on 5/16/21.
//

import SwiftUI

class textLimit: ObservableObject {
    var limit = 5
    
    @Published var input = "" {
        didSet {
            if input.count > limit {
                input = String(input.prefix(limit))
            }
        }
    }
}

struct ContentView: View {
    
    @ObservedObject private var textInput = textLimit()
    
    //@State private var textInput = ""
    
    var body: some View {
        Form {
            TextField("Some Text", text: $textInput.input)
                .keyboardType(.numberPad)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
