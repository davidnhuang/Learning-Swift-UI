import UIKit

// Protocols make something require specific methods or properties - this is called conforming to a prototcol

// Here, we create a protocol where anything conforming to it will have the id property that can be read (get) or written (set)
protocol Identifiable {
    var id: String {get set} // Any object conforming to Identifiable must have the id property
}

protocol Callable {
    var responding: Bool {get set}
}

struct User: Identifiable, Callable {
    var id: String
    var responding: Bool
}

func displayID(who user: User, identity: Identifiable, responsive: Callable) {
    print("My ID is \(identity.id)")
    
    if responsive.responding {
        print ("I am responding")
    } else {
        print ("Not responsive")
    }
    
}

let randomUser = User(id: "2", responding: true)
displayID(who: randomUser, identity: randomUser, responsive: randomUser)

// Protocol inheritence
protocol Payable {
    func calculateWages() -> Int
}

protocol Trainable {
    func study()
}

protocol HasVacation {
    func vacationDates(days: Int)
}

protocol Employee: Payable, Trainable, HasVacation {
    // Now, by conforming to Employee, you conform to Payable, Trainable, HasVacation protocols
}

// You can extend a type so that it can include methods
extension Int {
    func squared() -> Int {
        return self*self
    }
    
    var isEven: Bool {
        return self % 2 == 0
    }
}

let number: Int = 8
number.squared() // return 64
number.isEven // return true

// You can also extend protocols

// Sets and arrays are both Collection protocols
let siblingsInOrder = ["Christine", "David", "Catherine"]
let siblings = Set(["David", "Catherine", "Christine"])

extension Collection {
    func summary() {
        print ("There are \(count) in here")
        
        for item in self {
            print(item)
        }
        
    }
}

siblingsInOrder.summary()
siblings.summary()
