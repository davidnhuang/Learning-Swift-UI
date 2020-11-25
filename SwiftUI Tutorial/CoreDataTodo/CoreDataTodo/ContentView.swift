//
//  ContentView.swift
//  CoreDataTodo
//
//  Created by David N. Huang on 9/28/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(fetchRequest: ToDoItem.getAllTodoItems()) var toDoItems: FetchedResults<ToDoItem>
    
    @State private var newToDoItem = ""
    
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    TextField("New Item", text: self.$newToDoItem)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    Button(action: {
                        
                        let toDoItem = ToDoItem(context: self.managedObjectContext)
                        toDoItem.title = self.newToDoItem
                        toDoItem.createdAt = Date()
                        
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print("error")
                        }
                        
                        self.newToDoItem = ""
                        
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                    }
                }
                Section(header: Text("To Do's")) {
                    ForEach (self.toDoItems) { toDoItem in
                        ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
                    }.onDelete { index in
                        let deleteItem = self.toDoItems[index.first!]
                        self.managedObjectContext.delete(deleteItem)
                        
                        // Save
                        do {
                            try self.managedObjectContext.save()
                        } catch {
                            print ("error saving")
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My List"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        
        // Boiler plate preview
        // ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
