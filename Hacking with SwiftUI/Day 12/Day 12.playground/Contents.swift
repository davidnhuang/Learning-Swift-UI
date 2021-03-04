import UIKit

// Optionals are variables that might or might not have a value
// Let's say you create an age property for a person - how do you know how old that person is before asking?
// You can use optionals in this case

// Optionals - Am I there? Or am I not?

struct Person {
    var name: String? = nil // Haven't asked for the person's name yet
    var age: Int? = nil // Haven't asked the person how old he/she is
}

let Stranger = Person(name: nil, age: nil)
// Stranger doesn't have a name and doesn't have an age

// Create Benny and assign name and age now
let Benny = Person(name: "Benny", age: 1)
// Benny is named Benny, and is 1 year old

// Unwrapping an optional - basically checking if there is or is not a value
// If the value is nil, you won't be able to assign the name to the unwrapped - thus going to else
if let unwrapped = Benny.name {
    print(unwrapped)
} else {
    print("Missing")
}

// Other then if let, you can also use guard let to unwrap an optional
// Guard let, if bumped in to a nil, will have you exit out the function/code

func greet(_ name: String?) {
    
    // Here, we would run this code and return the function if it bumps into a nil
    guard let unwrapped = name else {
        print("You didn't provide a name")
        return
    }
    
    print("Hello, \(unwrapped)")
    
}

// Force unwrap - if you are sure that there is data there, you can force Swift to get it using force unwrap !

let str = "5"

let display = Int(str)! // Telling swift that str has value that can be read as an integer
// However, if the value cannot be read as a integer, code will crash

// Implicitly unwrapped optionals
// Optionals that are unwrapped by default - however, if it doesn't, your code crashes
let deviceName: String! = nil // telling swift that you know this variable will get a value by the time you need to use it

// Optional chaining
let names = ["Christine", "David", "Catherine"]
let siblings = names.first?.uppercased() // checks if there is a first valuein the array, then uppercases it. if it doesn't - exits

// Trying an optional

enum accessError: Error {
    case granted
    case denied
}

let correctPassword = "12345"

func checkPassword(password: String) throws -> Bool {
    if password == correctPassword {
        throw accessError.granted
    } else {
        throw accessError.denied
    }
}

let myInput = "23456"

// Here, if the conditions fail, it will return a nil and your code will go to else case
if let enteredPassword = try? checkPassword(password: myInput) {
    print("\(enteredPassword) Granted")
} else {
    print("Password Denied")
}

// Here, if you are sure the value you are trying is not nil - else it will crash your code
// try! checkPassword(password: "abcd")

// Failable initializer - an init that might fail
struct Puppy {
    var name: String
    
    // This init can fail - if it does, return nil, thus the ? after init
    init?(name: String) {
        if name.count == 9 {
            self.name = name
        } else {
            return nil
        }
    }
}

// Type casting - checks the type of objects; in this example, we are checking in an array of classes to see which one is a Dog type, and carries out a function

class Animal {
    var canMove = true
}

class Fish: Animal {
    var liveInWater = true
}

class Dog: Animal {
    func makeNoise() {
        print("Woof")
    }
}

let goldFish = Fish()
let carp = Fish()
let poodle = Dog()
let goldenRetriever = Dog()

let pets = [goldFish, poodle, carp, goldenRetriever]

// We want to make a function that has all dogs in our pet array do the bark function
for pet in pets {
    
    // Here, we basically check if, in the array of pets, if the object is a dog type. If it is, execute the makeNoise function
    if let petDog = pet as? Dog {
        petDog.makeNoise()
    }
}
// This loop will print 2 Woofs cause 2 pets are Dog types, 
