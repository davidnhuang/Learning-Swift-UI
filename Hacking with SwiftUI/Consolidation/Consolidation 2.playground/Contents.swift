// Consolidation 2
import UIKit

//01 - Function
// No parameters
func printFavoriteNumber() {
    print ("My favorite number is Lucky 7")
}
printFavoriteNumber()

// Parameters
func listTopOptions(option1: String, option2: String, option3: String) {
    print("""
    First option is \(option1),
    Second option is \(option2),
    Last option is \(option3)
    """)
}
listTopOptions(option1: "Apple pie", option2: "Cherry pie", option3: "Pumpkin pie")

// External internal labels
func totalDollarsInvested(firstInvest first: Int, secondInvest second: Int) {
    print("""
    Your first investement is $\(first)
    Your second investment is $\(second)
    Your total investment is $\(first+second)
    """)
}

totalDollarsInvested(firstInvest: 4000, secondInvest: 10_000)

// Good example of using labels
func countLetters(in string: String) {
    print("\(string) has \(string.count) letters.")
}
// When read aloud, it makes sense to humans - strive for this
countLetters(in: "Dandilion")

func addTogether(_ first: Int, _ last: Int) {
    let result = first + last
    print(result)
}
addTogether(5, 10)

// Return a value
func isPersonInRoster(name: String) -> Bool {
    let person = name
    switch person {
    case "Jeremy" :
        return true
    case "Andy":
        return true
    case "Bran":
        return true
    default:
        return false
    }
}

let personNextInLine = "Sally"

if isPersonInRoster(name: personNextInLine) {
    print ("Welcome")
} else {
    print ("Sorry, you're not on the list.")
}

//02 - Optionals - Nil
// For this function, we are promising that the function will DEFINITELY return a string
func getPlayerStatus() -> String {
    return "Online"
}

// But what if the player is offline? Or what if the player hasn't even signed up yet?
// In the following function, we are saying it MIGHT return a string
func getPlayerUsername(playerID: Int) -> String? {
    switch playerID {
    case 1:
        return "BlackMamba1"
    case 2:
        return "Nijotak"
    case 3:
        return "Rebelsapling"
    case 4:
        return "llScoutSniperll"
    default:
        return nil // No player on record
    }
}

func giveGodAccess(username: String) {
    if username == "BlackMamba1" {
        print ("BlackMamba1 has been given God Access")
    }
}

// Optional unwrap
// In these lines, we first need to check if the selected player is registered, and not nil. We check it using the if let
if let selectedPlayer = getPlayerUsername(playerID: 15) {
    // Now that we've verified that the player does exist in our roster - we execute the function
    giveGodAccess(username: selectedPlayer)
} else {
    // Since the player is not in our range - we indicate that the player doesn't exist
    print ("Player doesn't exist")
}

// Another example
func getAlbumReleaseYear(album name: String) -> Int? {
    switch name {
    case "Album 1":
        return 2008
    case "Album 2":
        return 2010
    case "Album 3":
        return 2020
    default:
        return nil // Not on record
    }
}

// Always default to optional unwrap
if let albumYear = getAlbumReleaseYear(album: "Album 4") {
    print (albumYear)
} else {
    print ("Album not on record")
}

// Or, if you know for sure that the album is on record - you can force unwrap it
let album1Year = getAlbumReleaseYear(album: "Album 1")
print ("Album 1 is released in \(album1Year!)") //This is risky - only do this if you are absolutely sure

//03 - Optional chaining
// Check if the value exists - if it does, run something
func getAlbumArtwork(for album: String) -> String? {
    switch album {
    case "Album 1":
        return "album1.png"
    case "Album 2":
        return "album2.png"
    case "Album 3":
        return "album3.png"
    default:
        return nil // album not found
    }
}

let selectedAlbumArtwork = getAlbumArtwork(for: "Album 1")?.capitalized // this basically says - if album 1 exists, capitilize

// Nil coelescing - ??
// If value A is nil, use B - so we always have data
func getAlbumName(id: Int) -> String? {
    switch id {
    case 1:
        return "album1.png"
    case 2:
        return "album2.png"
    case 3:
        return "album3.png"
    default:
        return nil // album not found
    }
}
let selectedAlbumName = getAlbumName(id: 10) ?? "Album not found" // if album 10 exists, get name, else show Album not found

// 04 - Enumeration
// A collection of all possible values - easily collected together as one

enum weatherType {
    case sunny, cloudy, raining, windy, snowing
}

func wearJacket(weather: weatherType) -> Bool {
    if weather != weatherType.sunny {
        return false
    } else {
        return true
    }
}

let shouldWearJacket = wearJacket(weather: .raining) // with Swift type inference, we can omit weatherType and just write .raining

if shouldWearJacket {
    print ("Yes, wear a jacket")
} else {
    print ("No, don't wear jacket")
}

enum transportMethod {
    case walking
    case biking
    case driving (speed: Int)
    case flying
}

func getSpeedLimit(by transport: transportMethod) -> Int? {
    switch transport {
    case .walking, .biking:
        return 30
    case .driving(let speed) where speed > 60:
        return 65
    case .flying:
        return 800
    default:
        return nil
    }
}

let personSpeeding = getSpeedLimit(by: .driving(speed: 100))
print ("This person is speeding at over \(personSpeeding ?? 40) mph")

//05 - Structs
// Use structs if you want to create custom complex data types

struct typeface {
    var typeface: String
    var weight: Int
    var color: String
    var text: String
}

var Titling = typeface(typeface: "Proxima Nova", weight: 300, color: "#19203", text: "Placeholder")
Titling.text = "Breaking News" // change value

// You can also provide functions inside a struct
struct SIMSchar {
    var name: String
    var gender: String
    var clothes: String
    var shoes: String
    var hobby: String
    
    func greetPlayer() {
        print ("Hello, I am \(name), and my favorite thing to do is \(hobby.lowercased())")
    }
}

let mySIM = SIMSchar(name: "Mikey", gender: "Male", clothes: "T-Shirt", shoes: "Sneakers", hobby: "yoga")
mySIM.greetPlayer()

// 06 - Classes
// Classes may look like structs, but they work differently in the following ways:
// - you need to have your own init
// - classes can be based on another class
// - objects

class SIMScharacter {
    var name: String
    var hobby: String
    var isMale: Bool
    
    init(called name: String, male isMale: Bool, likes hobby: String) {
        self.name = name
        self.isMale = isMale
        self.hobby = hobby
    }
    
    func greetPlayer() {
        print ("Hello, I am \(name), and my favorite thing to do is \(hobby.lowercased())")
    }
    
    func move() {
        print ("Walking...")
    }
}

let myNewSIM = SIMScharacter(called: "Aallan", male: true, likes: "canoing")

myNewSIM.greetPlayer()

// Override the parent class inherited function
class SpecialSIMS: SIMScharacter {
    override func move() {
        print("Flying")
    }
}

var myThirdSIM = SpecialSIMS(called: "Jane", male: false, likes: "building")

// You can also add additional paramters on top of already created classes using super.init
class RichSims: SIMScharacter {
    
    var startingCash: Int
    
    init(name: String, isMale: Bool, hobby: String) {
        self.startingCash = 500
        super.init(called: name, male: isMale, likes: hobby)
    }
    
}

// @objc
// use @objc in front of your function for ios to use
