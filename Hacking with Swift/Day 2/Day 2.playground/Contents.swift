import UIKit

// Arrays
let firstPerson = "John"
let secondPerson = "Jane"
let thirdPerson = "Larry"

let listOfNames: [String] = [firstPerson, secondPerson, thirdPerson]
listOfNames[1]

// Sets - collection of unordered items - will not return duplicates
let firstColor = "red"
let secondColor = "blue"
let thirdColor = "green"
let forthColor = "red"
let fifthColor = "blue"

let uniqueColors = Set([firstColor, secondColor, thirdColor, forthColor, fifthColor])

// Tuples - cannot change the size or the type
var name = (first: "David", last: "Huang")
name.first

name.first = "Davis"
name

// If you need a specific fixed collection set, use a tuple
// If you need a to check collection of value that are unique, use set
// If you need to check an ordered list of items, use array - most common

// Dictionaries - arrays of values with identifier, or keys
let heights = [
    "dad": 171,
    "mom": 156,
    "sister": 160,
]

heights["dad"]

// Dictionary default key
let icecreamFlavor = [
    "dad's": "chocalate",
    "sister's": "vanilla"
]

icecreamFlavor["dad's"]
icecreamFlavor["brother's", default: "Unknown"]

// Empty collections
// Empty dictionary
var emptyDictionary = [String: String]()
// or
var stdEmptyDictionary = Dictionary<String, String>()

// Empty array
var emptyArray = [Int]()
// or
var stdEmptyArray = Array<Int>()

// Empty sets
var emptySet = Set<String>()

//Enumeration - enum - are ways to defining related values; For example, a test result can be success or failure
enum testResult {
    case Success
    case Failure
}

let test1result = testResult.Failure

// Enums also allow you to have associated value to provide more nuanced data
enum state {
    case foreground(inUse: Bool)
    case quit(forceQuit: Bool)
    case running(uptime: Int)
}

let appStatus = state.running(uptime: 100)

// Enum raw values
enum planet: Int {
    case earth = 1
    case venus
    case mars
    case jupiter
}

let jupiter = planet(rawValue: 4)
