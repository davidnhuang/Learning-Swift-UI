//
//  ContentView.swift
//  WordScramble
//
//  Created by David N. Huang on 7/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // Spellchecking
        let word = "word"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let noMistake = misspelledRange.location == NSNotFound
        
        NavigationView {
            List {
                ForEach(0..<6) {
                    Section(header: Text("Section \($0+1)")) {
                        ForEach(0..<5) {
                            Text("Item \($0)")
                        }
                    }
                }
                
//                Section(header: Text("Special Section")) {
//                    // Special section that loads only when file is found
//                    if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
//                        // File found - data retrieved
//                        if let fileContent = try? String(contentsOf: fileURL) {
//                            // Since this is empty - nothing will load
//                        }
//                    }
//                }
                    
            }
            .navigationTitle(Text("List View"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
