//
//  OrderSheet.swift
//  SwiftUI Midterm
//
//  Created by David N. Huang on 1/9/21.
//

import SwiftUI

struct OrderSheet: View {
    
    // Variables and constants
    let pizzaTypes = ["Pizza Margherita", "Greek Pizza", "Pizza Supreme", "Pizza California", "New York Pizza"]
    
    // Starting states
    @State var selectedPizzaIndex = 1
    @State var numberOfSlices = 1
    @State var tableNumber = ""
    
    // To start saving to CoreData, we have to set up our scratchpad viewContext
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Form{
                    Section(header: Text("Pizza Details")) {
                        
                        // Picker allows you to pick from a list
                        Picker(selection: $selectedPizzaIndex, label: Text("Pizza Type")) {
                            ForEach(0 ..< pizzaTypes.count) {
                                Text(self.pizzaTypes[$0]).tag($0)
                            }
                        }
                        
                        // Stepper is a counter that adds / takes away from a number
                        Stepper("\(numberOfSlices) Slices", value: $numberOfSlices, in: 1...12)
                    }
                    
                    Section(header: Text("Table")) {
                        // Text input field with a keyboard only with numbers
                        TextField("Table Number", text: $tableNumber).keyboardType(.numberPad)
                    }
                }
                
                Button(action: {
                    //Here is were we save our information to our scratchpad
                    
                    guard self.tableNumber != "" else {return} //We need to make sure that our tableNumber field is not empty
                    let newOrder = Order(context: viewContext) //We initialize the Order struct here
                    
                    // Start assigning our data - stage for save
                    newOrder.pizzaType = self.pizzaTypes[self.selectedPizzaIndex] // we take the value we selected in Picker and assign it here
                    newOrder.orderStatus = .pending
                    newOrder.tableNumber = self.tableNumber
                    newOrder.numberOfSlices  = Int16(self.numberOfSlices)
                    newOrder.id = UUID()
                    
                    // Now we try to save
                    do {
                        try viewContext.save()
                        print("Play Hpatic")
                        presentationMode.wrappedValue.dismiss() // Dismiss this card
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }, label: {Text("Add Order")})
                .frame(height: 56)
            }
            .navigationTitle("Add Order")
        }
    }
    
}

extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct OrderSheet_Previews: PreviewProvider {
    static var previews: some View {
        OrderSheet()
    }
}
