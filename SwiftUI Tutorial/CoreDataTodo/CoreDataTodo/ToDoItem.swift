//
//  ToDoItem.swift
//  CoreDataTodo
//
//  Created by David N. Huang on 9/28/20.
//  Here, we are creating the class that we've added in CoreData

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
    // Create attributes
    @NSManaged public var createdAt:Date?
    @NSManaged public var title:String?
}

// Fetch item function
extension ToDoItem {
    static func getAllTodoItems() -> NSFetchRequest<ToDoItem> {
        
        let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
        
    }
}
