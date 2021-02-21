import UIKit

// Initializer

// Memberwise initializer
struct User {
    var username: String // you must provide this when calling User
    
    // Init allows the struct to do things by default on initialization
    init() {
        username = "Anonymous"
        print("Creaating user...")
    }
    
}

// Notice how the init assigned the string Anonymous when the struct is initialized - therefore the username is Anonymous
var firstUser = User()
print(firstUser.username)

// We can then assign new values to it
firstUser.username = "David"
print(firstUser.username)

// Referring to current instance using self.
struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        // notice of self.name refers to the var name outside of the init, whereas the other name is from the parameter
        self.name = name
    }
}

// Lazy property
// Create property only when you need it using lazy var

struct familyTree {
    init() {
        print("Creating family tree...")
    }
}

struct familyMember {
    var name: String
    lazy var getFamilyTree = familyTree()
    
    init(name: String) {
        self.name = name
    }
}

var Edward = familyMember(name: "Ed") // getFamilyTree is not created
Edward.getFamilyTree // getFamilyTree is created only when you access it

// Static props and methods
// Static properties apply to all instances of a struct!

struct Student {
    
    // This properties apply to ALL instances of struct Student
    static var classSize = 0
    
    // This will only be applied to the specific instance of Student
    var name: String
    
    // Assign name everytime the struct is created
    init(name: String) {
        self.name = name
        Student.classSize += 1 // To manipulate that static property, we need to reference Student instead of self since this applies to ALL Student
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

print(Student.classSize) // should return 2

// Access control
// Restrict access to specific properties in a struct.

struct SSN {
    
    // Private var allows you to create it but doesn't allow you to read it without using a method
    private var id: String
    var name: String
    var adminPassword: String
    
    init(id: String, name: String, adminPassword: String) {
        self.id = id // assign id: into var id
        self.name = name
        self.adminPassword = adminPassword
    }
    
    func accessSSN(password: String) {
        if password == adminPassword {
            print(id)
        } else {
            print("Access Denied.")
        }
    }
    
}

// Assigning the values and creating the instance John Doe
let JohnDoe = SSN(id: "D1929D", name: "John Doe", adminPassword: "12345")

// Trying to read a private var
// JohnDoe.id doesn't work

// However, using the method inside allows you to access
JohnDoe.accessSSN(password: "12345") // Access granted!
JohnDoe.accessSSN(password: "hello") // Access denied.
