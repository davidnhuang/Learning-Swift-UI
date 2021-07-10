//
//  ContentView.swift
//  WordScramble
//
//  Created by David N. Huang on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Text Input
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                
                // List
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                            
            }
            .navigationTitle(Text("Root Word"))
        }
    }
    
    //Methods
    func addNewWord() {
        let answer = newWord.lowercased()
            .trimmingCharacters(in: .whitespaces)
        
        // Guards against empty
        guard answer.count > 0 else {
            return
        }
        
        // Adds answer to the usedWord array - then reset newWord
        usedWords.insert(answer, at: 0)
        newWord = ""
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
