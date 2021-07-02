//
//  ContentView.swift
//  BetterRest
//
//  Created by David N. Huang on 6/25/21.
//

import SwiftUI

struct customCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundColor(.gray)
    }
}

extension View {
    func customCaptionText() -> some View {
        self.modifier(customCaption())
    }
}

struct ContentView: View {
    
    @State private var sleepAmount = 8
    @State private var wakeUp = Date()
    @State private var coffeeAmount = 1
    
    //Alert message
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    let now = Date()
    let sleepRange = 0...12
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .ignoresSafeArea(.all)
                    .foregroundColor(.white)
                VStack {
                    VStack(spacing: 24) {
                        VStack(alignment: .leading) {
                            Text("When do you want to wake up")
                                .customCaptionText()
                            DatePicker("Wake on", selection: $wakeUp, in: now...)
                        }
                        VStack(alignment: .leading) {
                            Text("How many hours would you like to sleep")
                                .customCaptionText()
                            Stepper(value: $sleepAmount, in: sleepRange) {
                                if sleepAmount <= 1 {
                                    Text("\(sleepAmount) hour")
                                } else {
                                    Text("\(sleepAmount) hours")
                                }
                            }
                        }
                        VStack(alignment: .leading) {
                            Text("How many cups of coffee have you had")
                                .customCaptionText()
                            Stepper(value: $coffeeAmount, in: 1...20) {
                                if coffeeAmount == 1 {
                                    Text("1 cup")
                                } else {
                                    Text("\(coffeeAmount) cups")
                                }
                            }
                        }
                    }
                }
            }
            .padding(.all, 16)
            .navigationTitle("BetterRest")
            .navigationBarItems(trailing:
                Button(action: calculateBetTime) {
                    Text("Calculate bed time")
                }
            )
        }
        .alert(isPresented: $showAlert, content: {
            Alert(
                title: Text(alertTitle),
                message: Text(alertMessage),
                dismissButton: .default(Text("Ok"))
            )
        })
    }
    
    // Methods
    func calculateBetTime() {
        
        // Seet up ML class
        let model = SleepCalculator()
        
        // Date setup
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minutes = (components.minute ?? 0) * 60
        
        // In case ML fails
        do {
            let prediction = try model.prediction(wake: Double(hour + minutes), estimatedSleep: Double(sleepAmount), coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            alertTitle = "Your ideal bedtime"
            alertMessage = formatter.string(from: sleepTime)
        } catch {
            // something went wrong
            alertTitle = "Something went wrong"
            alertMessage = "We couldn't calculate your sleep time"
        }
        
        // Present alert
        showAlert = true
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
