//
//  Order+CoreDataProperties.swift
//  SwiftUI Midterm
//
//  Created by David N. Huang on 1/9/21.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var tableNumber: String
    @NSManaged public var pizzaType: String
    @NSManaged public var numberOfSlices: Int16
    @NSManaged public var id: UUID?

}

extension Order {
    
    @NSManaged public var status: String
    
    // What this does check if Status holds any value, if it is nil, set it to .pending
    var orderStatus: Status {
        set {
            status = newValue.rawValue
        } get {
            Status(rawValue: status) ?? .pending
        }
    }
}

extension Order : Identifiable {

}

enum Status: String {
    case pending = "Pending"
    case preparing = "Preparing"
    case completed = "Completed"
}
