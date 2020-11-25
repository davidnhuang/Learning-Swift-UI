//
//  ContentView.swift
//  CoreDataTodoReview
//
//  Created by David N. Huang on 10/25/20.
//

import SwiftUI
import CoreData

struct ContentView: View {

	@Environment(\.managedObjectContext) var managedObjectContext
	@FetchRequest(fetchRequest: ToDoItem.getAllToDoItems()) var toDoItem: FetchedResults<ToDoItem>
	
	@State private var newToDoItem = ""
	
    var body: some View {
		NavigationView {
			List {
				Section(header: Text("What's next")) {
					HStack {
						TextField("New item", text: self.$newToDoItem)
						Button (action: {
							let toDoItem = ToDoItem(context: self.managedObjectContext)
							toDoItem.title = self.newToDoItem
							toDoItem.createdAt = Date()
							
							//Save
							do {
								try self.managedObjectContext.save()
							} catch {
								print(error)
							}
							
							self.newToDoItem = ""
							
						}) {
							Image(systemName: "plus.circle.fill")
								.foregroundColor(.green)
								.imageScale(.large)
						}
					}
				}
				
				Section (header: Text("To Do")) {
					ForEach (self.toDoItem) {toDoItem in
						ToDoItemView(title: toDoItem.title!, createdAt: "\(toDoItem.createdAt!)")
					}
				}
			}
			.navigationBarTitle(Text("My List"))
			.navigationBarItems(trailing: EditButton())
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
