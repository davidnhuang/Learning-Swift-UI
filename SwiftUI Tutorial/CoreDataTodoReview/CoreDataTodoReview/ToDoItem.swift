//
//  ToDoItem.swift
//  CoreDataTodoReview
//
//  Created by David N. Huang on 10/25/20.
//	Make sure this matches the CoreData item name

import Foundation
import CoreData

public class ToDoItem: NSManagedObject, Identifiable {
	
	@NSManaged public var createdAt: Date?
	@NSManaged public var title: String?

}

extension ToDoItem {
	static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
		let request: NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
		let sortDescriptor = NSSortDescriptor(key: "created", ascending: true)
		
		request.sortDescriptors = [sortDescriptor]
		
		return request
	}
}
