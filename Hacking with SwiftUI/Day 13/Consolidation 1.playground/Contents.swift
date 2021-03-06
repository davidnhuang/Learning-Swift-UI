import UIKit

// REVIEW - DAY 1

// Variable
var increaseNumber = 0 // this can be changed
increaseNumber += 1 // changing the variable
// Constants
let Name = "david" // this cannot be changed - prefer constants over variables

// Data types
let Text: String = "String of text" // strings
let WholeNumber: Int = 10 // integers - no decimals allowed
let AccurateNumber: Double = 0.251029801233 // doubles - allow decimals - prefer this over float
let Switch: Bool = true // boolean - true or false
let LessAccurateNumber: Float = 0.251023123 // will only store up to 7th decimal place
// Swift is type safe, you cannot change a String type to a Int - you must be intentional
// Always prefer type inference
let MyName = "David"
let SwitchedOn = true
let Longitude = 0.2910092

// Operators
var a = 10
var b = 40

let addition = a+b // returns 50
let subtract = b-a // returns 30
let multiple = a*b // returns 400
let divide = b/a // returns 4
let remainder = b%a // returns 0 since it divides with no remainders

// Comparison - returns if the statements are true or false
a > b // greater than b, returns false
a >= b // greater than or equals, returns false
a == b // are the same, returns false
SwitchedOn // returns true
!SwitchedOn // returns false - reverses

// String interpolation - insert anything into a string of text
let statement = "a plus b is equal to \(addition)" // returns a plus b is equal to 50
let speech = "\(MyName) said, 'a multipled by b is \(multiple), and divided is \(divide)'"

// Collections of data
let ListOfNames = ["Chrstine", "David", "Catherine"]
let ListOfAges = [27, 25, 24]
let FirstChild = ListOfNames[0]
var emptyListOfNames = [String]()
emptyListOfNames.append("Sally") // Adds Sally to emptyListOfNames - can only add one thing
var combinedList = ListOfNames + emptyListOfNames

// Dictionaries
let Individual = [
    "first name": "David",
    "middle name": "",
    "last name": "Huang",
    "age": "2" // notice how this must be a string instead of an int
]
Individual["first name"] // returns David

// Conditionals
if a > b {
    print("\(a) is greater than \(b)")
} else if a < b {
    print("\(a) is less than \(b)")
} else {
    print("not a clue")
}

// && is and, || is or
if a < b || a >= b {
    print("\(a) is either less than or greater than or equal to \(b)") // this is dumb code, but just illustrating
} else if a < b && a <= b {
    print ("\(a) is less than or equal to \(b)")
}

// If you want to check if some thing is false
if a > b && b%a != 0 {
    print ("\(a) is greater than \(b) and \(b) is not divisible by \(a)")
} else {
    print("")
}

// Loops - repeating a code over and over again until it reaches a condition
// For loop
for meters in 0...5 {
    print ("You are \(meters) away.")
}
for num in 0...5 {
    let square = num*num
    print(square)
}

//Nesting loops
var listOfPeople = ["David", "John", "Kristy", "Cena"]
for person in 0..<listOfPeople.count {
    let personInLine = "\(listOfPeople[person])"
    
    for count in 1...3 {
        let output = "\(personInLine) counted \(count)"
        print (output)
    }
}
// While loop
// Make sure to always set these conditions or else your stack will overflow
var canExecute = true
var iteration = 0
while canExecute {
    iteration += 1
    if iteration == 5 {
        print ("complete")
        break
    }
}
// Switch case - what variable to check and a list of possible variables
let BooksRead = 2
switch BooksRead {
case 0:
    print("Not started")
case 1...3:
    print("Starting to get there")
case 4:
    print("Goal reached!")
default:
    print("Well read.")
}
