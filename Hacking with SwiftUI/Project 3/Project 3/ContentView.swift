//
//  ContentView.swift
//  Project 3
//
//  Created by David N. Huang on 6/23/21.
//

import SwiftUI

// Custom modifier
struct CustomTitle: ViewModifier {
    func body(content: Content) -> some View {
        
        // content is passed, and the following modifiers are applied
        content
            .font(.system(size: 40))
            .foregroundColor(.gray)
    }
}

struct CustomCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28))
            .foregroundColor(.secondary)
    }
}

// Custom Container
// Make your own grid
struct GridStack<Content: View>: View {
    let rows: Int
    let col: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< col) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

// Making modifiers easier to read
extension View {
    func customTitleStyle() -> some View {
        self.modifier(CustomTitle())
    }
    func customCaptionStyle() -> some View {
        self.modifier(CustomCaption())
    }
}

struct ContentView: View {
    
    // States
    @State private var useRedText = false
    
    // Properties - views stored as variables / constants
    let line1 = Text("Title")
    let line2 = Text("Subtitle")
    let line3 = Text("Body")
    
    // Reusable views
    struct pillText : View {
        var text: String
        
        var body: some View {
            Text(text)
                .font(.caption)
                .fontWeight(.bold)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
        }
    }
    
    var body: some View {
        VStack {
            GridStack(rows: 4, col: 4) { row, col in
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
            }
            .padding()
            
            VStack(spacing: 12) {
                line1
                    .customTitleStyle()
                line2
                    .customCaptionStyle()
                line3
                    .font(.body)
                
                Spacer()
                
                pillText(text: "Text")
                
                Spacer()
            }
            .padding(.top, 20) // environment modifier
            
            Spacer()
            
            Button("Press me") {
                self.useRedText.toggle() // toggle() flipes a boolean
            }
            .foregroundColor(useRedText ? .red : .blue)
            
        }
        .padding(.top, 20) // environment modifier
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
