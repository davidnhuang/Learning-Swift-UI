import UIKit

// Structs allow you to make your own type of object

struct sport {
    var name: String
}

// create tennis as a sports type with the property name Tennis
var tennis = sport(name: "Tennis")

print(tennis.name)
tennis.name = "Roger"

print(tennis.name)

// Computed properties
struct newSport {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic Sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
    
}

let chess = newSport(name: "Chess", isOlympicSport: false)

print(chess.olympicStatus)

// Property observer
struct Progress {
    var task: String
    var amount: Int {
        // Run this code anytime this var is updated / changed - didset is observing for changes
        didSet {
            print("\(task) is \(amount)% complete.")
        }
    }
}

var progressChange = Progress(task: "Download", amount: 20)

progressChange.amount = 40
progressChange.amount = 80
progressChange.amount = 100

// You can put functions inside of structs, called Methods - they are declared the same way using func
struct City {
    var population: Int
    func collectTax() -> Int {
        return population * 1000
    }
}

let SF = City(population: 2_030_192)
SF.collectTax()

// Struct is constant, so its properties cannot be changed - unless you change it using a mutating func
struct Account {
    var username: String
    
    // Mutating func allows us to change values declared in the struct
    mutating func makePrivate() {
        username = "Private account"
    }
    
}

var firstAccount = Account(username: "Andy1")
firstAccount.makePrivate()

print (firstAccount.username)

// Strings are actually structs! so there are methods that come with it
// Here are some nifty methods for strings
let sentence = "Do or do not, there is no try."
print(sentence.count) // count the amount of letters
print(sentence.hasPrefix("Do")) // whether it starts with Do string or not
print(sentence.uppercased()) // capitalizes all the letters
print(sentence.sorted()) // sorts the characters into an array
// And much more! View all of them by adding . after the string

// Here are some nifty methods for arrays - important!
var toys = ["Doll"]
toys.count //count number of values in the array
toys.append("Train") // adds value to the end of the array
toys.firstIndex(of: "Train") // locates the position of the first "Train" in the array
toys.sorted() // Sorts the items in the array
// View all of them by typing toys.
