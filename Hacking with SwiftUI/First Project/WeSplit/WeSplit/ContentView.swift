//
//  ContentView.swift
//  WeSplit
//
//  Created by David N. Huang on 5/15/21.
//

import SwiftUI

struct ContentView: View {
    
    let students = ["Harry", "Hermione", "Ron", "Drako", "Ginny"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Picker("Select a student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
