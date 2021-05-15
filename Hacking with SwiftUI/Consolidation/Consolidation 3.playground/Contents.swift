import UIKit

struct person {
    // Properties of the struct
    var isMale: Bool
    var name: String
    
    func describe() {
        if isMale {
            print("\(name) identifies as a male")
        } else {
            print("\(name) identifies as a female")
        }
    }
}

var Erica = person(isMale: false, name: "Erica")
var David = person(isMale: true, name: "David")

David.describe()
Erica.describe()

// Will set and did set
struct attire {
    var person: String
    var clothes: String {
        // if there is new value from init value
        willSet {
            dialog("I'm changing from \(clothes) to \(newValue)")
        } didSet {
            dialog("Done!, I've changed from \(oldValue) to \(clothes)")
        }
    }
}

func dialog(_ msg: String) {
    print(msg)
}

var MandyAttire = attire(person: "Mandy", clothes: "T-shirts")
MandyAttire.clothes = "Dress"

// Computer properties
struct identity {
    var name: String
    var ageYears: Int
    // Self setting - for displaying
    var ageInDays: Int {
        get {
            return ageYears*365
        }
    }
}

var grandpa = identity(name: "Jorge", ageYears: 78)
print("My grandfather is \(grandpa.ageYears) years old, or \(grandpa.ageInDays) days old")

// Static properties and methods
// Static - shared across instances
struct dog {
    static var family = "Canine"
    var name: String
}

let poodle = dog(name: "Ben")
dog.family// poodle.family won't work, because it is static; must be accessed from the struct itself

// Access Control - accessible from others or not

class Login {
    private let APIKey = 19284019283019 // not exposed to public
    public var username: String
    public var providedKey: Int
    
    func authorization(for usrname: String, with key: Int) -> Bool {
        if self.providedKey == self.APIKey {
            print ("API confirmed")
            return true
        } else {
            print ("Soemthing went wrong")
            return false
        }
    }
    
    init(username: String, userKey: Int) {
        self.username = username
        self.providedKey = userKey
        authorization(for: self.username, with: self.providedKey)
    }
}

let firstLogin = Login(username: "bob@jo.com", userKey: 19284019183019)
//firstLogin.APIKey // this will not work
firstLogin.username // this will return bob@jo.com

//Polymorphism - class inheriting from another
class mammal {
    static let warmBlooded = true
    static let lactation = true
    var name: String
    
    init(called name: String) {
        self.name = name
    }
}

class cat: mammal {
    var genus = "Feline"
    var canPurr = true
    var domesticated: Bool
    
    // Make sure to fulfill all required parameters, even parent init
    init(name: String, isFerral: Bool) {
        self.domesticated = isFerral
        super.init(called: name)
    }
}

var kittyBooBoo = cat(name: "Bum Bum", isFerral: false)
var dogBooBoo = mammal(called: "Wagster")
