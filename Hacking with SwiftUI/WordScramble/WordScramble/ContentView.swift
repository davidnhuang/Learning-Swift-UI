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
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
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
            .navigationTitle(rootWord)
            // Code loads when view appears - when we start the app
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("Ok")))
            }
        }
    }
    
    //Methods
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespaces)
        
        // Guards against empty
        guard answer.count > 0 else {
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", msg: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", msg: "You can't just make them up, you know!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not real", msg: "This is not a real word")
            return
        }
        
        // Adds answer to the usedWord array - then reset newWord
        usedWords.insert(answer, at: 0)
        newWord = ""
        
    }
    
    // Loads and displays start.txt on startup
    func startGame() {
        // Locate start.txt in our main app bundle
        if let url = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWord = try? String(contentsOf: url) {
                let allWords = startWord.components(separatedBy: "\n")
                rootWord = allWords.randomElement()?.capitalized ?? "Silkworm"
                return
            }
        }
        
        fatalError("Could not find start.txt in main Bundle")
    }
    
    // check if word is not used
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    // check
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, msg: String) {
        errorTitle = title
        errorMessage = msg
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
