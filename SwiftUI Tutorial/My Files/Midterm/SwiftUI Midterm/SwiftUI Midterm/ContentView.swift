//
//  ContentView.swift
//  SwiftUI Midterm
//
//  Created by David N. Huang on 1/9/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    // Default sets when view launches
    @State var showOrderSheet = false
    
    // Starting our viewContext
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Order.entity(), sortDescriptors: [], predicate: NSPredicate(format: "status != %@", Status.completed.rawValue)) // Show all that don't have completed status
    
    var orders: FetchedResults<Order>
    
    var body: some View {
        NavigationView {
            Form {
                List {
                    // Got through each in orders results
                    ForEach(orders) { order in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(order.pizzaType)").font(.headline)
                                Text("Table \(order.tableNumber)  - \(order.numberOfSlices) slices").font(.subheadline)
                            }
                            Spacer()
                            Button(action:{updateOrder(order: order)}) {

                                //order.orderStatus == .pending ? "Prepare" : "Complete"
                                Text(statusText(order: order)).foregroundColor(.blue) // Basically saying is it pending? If yes, show Prepare, or else show Complete
                            
                            }
                        }
                        .frame(height: 50)
                    }
                    // Setting up swipe to delete interaction
                    .onDelete { indexSet in
                        for index in indexSet {
                            viewContext.delete(orders[index])
                        }
                        do {
                            try viewContext.save()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
            .navigationTitle("🍕 Pizza Order")
            .navigationBarItems(
                trailing:
                    HStack{
                        Button(action: {showOrderSheet = true},label: {Text("Add")})
                            .padding(8)
                        EditButton()
                    }
                )
            .sheet(isPresented: $showOrderSheet) {
                OrderSheet()
            }
        }
    }
    
    func updateOrder(order: Order) {
        let newStatus = order.orderStatus == .pending ? Status.preparing : .completed
        viewContext.performAndWait {
            order.orderStatus = newStatus
            try? viewContext.save()
        }
    }
    
    func statusText(order: Order) -> String {
        if order.orderStatus == .pending {
            return "Prepare"
        } else {
            return "Complete"
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
