//
//  ContentView.swift
//  Todo list tutorial
//
//  Created by David N. Huang on 12/14/20.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var searchBar : some View {
        HStack {
            TextField("Enter new task", text: self.$newToDo)
            Button(action: self.addNewTodo, label: { Text("Add New") })
        }
    }
    
    func addNewTodo() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        
        self.newToDo = ""
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar
                    .padding()
                List {
                    ForEach(self.taskStore.tasks) { task in
                        Text(task.toDoItem)
                    }
                    .onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }
                .navigationTitle(Text("Tasks"))
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func move(from source : IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offset: IndexSet) {
        taskStore.tasks.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
