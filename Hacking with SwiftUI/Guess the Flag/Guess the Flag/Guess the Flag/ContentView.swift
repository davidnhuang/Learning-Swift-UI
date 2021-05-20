//
//  ContentView.swift
//  Guess the Flag
//
//  Created by David N. Huang on 5/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tapCount = 0
    @State private var didTap = false
    @State private var label = "Cancel Appoinment"
    @State private var confirmCancel = false
    
    func tapResponse() {
        if !didTap {
            confirmCancel = true
            label = "Canceled"
        } else {
            return
        }
    }
    
    var body: some View {
        
        Form {
            Button(action:{tapResponse()}){
                HStack(spacing: 10) {
                    Image(systemName: "xmark")
                    Text(label)
                }.foregroundColor(.red)
            }
            .alert(isPresented: $confirmCancel, content: {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text("This action cannot be undone"),
                    primaryButton: .default(Text("Ok, cancel it")),
                    secondaryButton: .default(Text("Go back"))
                )
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
