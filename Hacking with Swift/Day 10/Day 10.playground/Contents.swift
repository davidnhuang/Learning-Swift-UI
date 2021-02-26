import UIKit

// Classes are similar to structs, but need to have its own init

class Mammal {
    var name: String
    var warmBlooded: Bool
    var canMove: Bool
    
    init(name: String, warmBlooded: Bool, canMove: Bool) {
        self.name = name
        self.warmBlooded = warmBlooded
        self.canMove = canMove
    }
}

// Classes can inherit from other classes - this is called sub-classing
// Here, Dog is a sub-class of mammal
class Dog: Mammal {
    
    // To initialize Dog, we pass in the name property
    init(name: String) {
        // Inheriting from the Mammal class, we use the Super.init, which inherits all the properties needed
        super.init(name: name, warmBlooded: true, canMove: true)
    }
}
// Charlie, an instance of Dog, which inherits mammal properties
let Charlie = Dog(name: "Charlie")
Charlie.canMove // returns true

// Child classes can override parent classes
class Cat {
    func makeNoise() {
        print("Meow")
    }
}

class silentCat: Cat {
    // Here, we will override the makeNoise function from parent class Cat
    override func makeNoise() {
        print("")
    }
}

let Maxwell = silentCat()
Maxwell.makeNoise() // this will be empty insteaad of Meow

// Final class - disallows inheritence
final class Kitty: Cat {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// This cannot be done since Kitty is a final class - and does not allow sub-classing
// class smallKitty: Kitty {
//      print("Does not work")
// }

// Classes, when copied,
class Singer {
    var name = "Frank Ocean"
}

var singer = Singer()
print(singer.name) // returns Frank Ocean

var singer2 = singer
singer2.name = "Jay Z" // Here, we change the name in the class Singer to Jay Z

print (singer.name) // Both singer and singer 2 now are Jay Z
print (singer2.name)

// Now, if we tried that with struct
struct SingerFrank {
    var name = "Frank Ocean"
}

var singer3 = SingerFrank()
print(singer3.name)

var singer4 = singer3
singer4.name = "Another Singer"

print(singer3.name) // This is Frank Ocean
print(singer4.name) // This is different

// Classes can be deinitialized, when it is destroyed
class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive!")
    }
    
    func greet() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more")
    }
    
}

for _ in 1...3 {
    let person = Person()
    person.greet()
    
    // as the function loops 3 time, each time its calling an instance of person
    // after the person is called, it is then destroyed, or deinitialized
    // Deinitializers is there to tell us that the class has run and is no more
}

// Mutability - variables in class can be changed, whiled var in structs cannot
class Artist {
    var name = "Daly"
}

// Notice how even with the let keyword, we were still able to change the properties of Artist.name
let newArtist = Artist()
newArtist.name = "Picaso"
print(newArtist.name)

// We can prevent change by using let inside class
class Picaso {
    let name = "Pablo Picasso"
}

let artist = Picaso()

// The following cannot work, because name property is constant
// artist.name = "Daly"

class Magazine {
    var pageCount = 132
}
var example = Magazine()
var wired = example
wired.pageCount = 164
print(example.pageCount)
var vogue = example
print(example.pageCount)
vogue.pageCount = 128
print(wired.pageCount)
print(vogue.pageCount)
print(example.pageCount)
