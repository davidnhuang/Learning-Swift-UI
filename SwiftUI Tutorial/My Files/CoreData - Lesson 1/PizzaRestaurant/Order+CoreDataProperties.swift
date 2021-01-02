//
//  Order+CoreDataProperties.swift
//  PizzaRestaurant
//
//  Created by David N. Huang on 12/29/20.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    //@NSManaged public var status: Status
    @NSManaged public var id: UUID?
    @NSManaged public var numberOfSlices: Int16
    @NSManaged public var pizzaType: String
    @NSManaged public var tableNumber: String

}

extension Order : Identifiable {

}

extension Order {
    
    //..
    @NSManaged public var status: String
    
    var orderStatus: Status {
        set {
            status = newValue.rawValue
        } get {
            Status(rawValue: status) ?? .pending
        }
    }
    
}


enum Status: String {
    case pending = "Pending"
    case preparing = "Preparing"
    case completed = "Completed"
}

