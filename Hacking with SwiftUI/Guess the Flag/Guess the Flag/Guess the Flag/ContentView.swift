//
//  ContentView.swift
//  Guess the Flag
//
//  Created by David N. Huang on 5/18/21.
//

import SwiftUI

struct FlagViewStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Capsule()) // clip shape
            .overlay(Capsule().stroke(Color.gray, lineWidth: 1)) // stroke outline
            .shadow(color: .gray, radius: 2) // shadow
    }
}

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "United Kingdom", "United States"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var resultTitle = ""
    
    
    var body: some View {
        ZStack {
            // Background gradient - lowest layer
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(.all)
            // Stack of text and flags
            VStack(spacing: 30) {
                VStack(spacing: 12) {
                    Text("Tap the flag of ").foregroundColor(.white)
                    Text(countries[correctAnswer]).foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                Spacer()
                // Loop through 3 items
                ForEach(0..<3) { number in
                    Button(action: {
                        self.didTap(number)
                    }) {
                        Image(self.countries[number])
                            .modifier(FlagViewStyle())
                            
                    }
                }
                Spacer()
                //Score
                Text("Your score: \(score)")
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(resultTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                resetGame()
            })
        }
    }
    
    func didTap (_ number: Int) {
        if number == correctAnswer {
            resultTitle = "Correct"
            score += 1
        } else {
            resultTitle = "Oops - that's not correct"
        }
        
        showingScore = true
    }
    
    func resetGame() {
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
