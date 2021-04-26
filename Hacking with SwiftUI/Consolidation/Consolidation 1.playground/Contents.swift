// Consolidation - Review Day 1
import UIKit

// 01 - Variables & constants
var integer = 1 // a variable - can be changed
integer = 2

let sun = true // a constant - cannot be changed

// 02 - Data types
var name = "David" // string
var num = 1 // integer
var state = true // boolean
var decimal = 1.123422342234 // double - highest accuracy
var float = -82.3333 // float

var firstName: String = "Daniel" // another way to declare - avoid

var symbol: String // another way to declare - type then assign - avvoid
symbol = "Icon"

// 03 - Operators
var first = 1
var second = 2

first + second // add - return 3
first - second // subtract - return -1
first * second // multiply = return 2
first % second // this one is a bit tricky - it means divide the left by the right evenly and return the REMAINDER - returns 1

first += 5 // add 5 and assign to first
first -= 5 // subtract 5 and assign to first

var a = 1.1
var b = 2.2
let result = a + b

var firstPerson = "Sam"
var secondPerson = "Harry"
let both = firstPerson + secondPerson

// 04 - Comparison
a > b // a is greater than b? returns false
a >= b // a is greater or equal to b? returns false
a < b // a is less than b? returns true
a <= b // a is less than or equal to b? returns true
a == b // a is equal to b? returns false
a != b // a is not equal to b? return true
// you can compare any data type
var passed = true
!passed // makes it opposite - false

// 05 - String interpolation
// Insert other data or functions or results into a string

var username = "user1234"
var regMsg = "Your username is \(username)"
print (regMsg)

let longitude = 24.39102948
let latitude = -0.298375818
let location = "Pin dropped at \(longitude) \(latitude)"

// 06 - Array
var evenNum = [2,4,6,8] //Array of int
var userBase: [String] = ["Alex", "William", "Chris"] // Array of string

evenNum[0] // returns the first
userBase[2] // return the last
// If you read out of the range, it will crash
type(of: evenNum) // this returns the data type housed in the array - in this case it's int

var collectAll: [Any] = ["Alex", 3, 4.2, true] // this array can store any type

var emptyArrayOfString = [String]()
// or var emptyArrayOfString: [String] = []

var collection1 = [1,2,3,4,5]
var collection2 = [6,7,8,9,10]

var collections = collection1 + collection2

// 07 - Dictionaries
// Collection where values can be accessed through "keys"

var person = [
    "first name": "David",
    "last name": "Huang",
    "Address": "123 Main Street",
    "Education": "Bachelors"
]

person["first name"] // returns David

//08 - Conditionals
// If, Else, Else if
var runState = true
// The following code will run only if runState is true
if runState {
    print("run code")
    runState = false // set to false so it doesn't overflow - code runs once
}

var weather = "sunny"
if weather == "sunny" {
    print ("Bring sunglasses")
} else {
    print ("Don't bring sunglasses")
}

var conditions = "good"
if conditions == "good" {
    print ("Begin")
} else if conditions == "acceptable" {
    print ("Adjust")
} else {
    print ("Abort mission")
}

// Checking if more than one condition is true
var licensed = true
var age = 16

if licensed && age >= 16 {
    print ("Can learn driving")
} else {
    print ("Not allowed to drive")
}

// Checking if conditions is not true
var vitalsOnline = true

if !vitalsOnline {
    print ("Critical procedure begin...")
}

//09 - Loops

// For - includes first and last
for _ in 1...10 {
    print ("this will print 10 times.")
}
// if you want to return the current index
for index in 1...5 {
    print ("\(index) position")
}
// exclude last position
for _ in 1..<4 {
    print ("this will print 3 times")
}
// every item in an array
var entries = ["Entry 1", "Entry 2", "Entry 3"]
for entry in entries {
    print (entry)
}

for _ in 0..<entries.count {
    for index in 1...3 {
        print ("\(index) 3 times")
    }
}

//While
var game = true
var touchDetected = 0

while game {
    print ("Running")
    touchDetected += 1
    
    if touchDetected == 500 {
        print ("Tap detected")
        break // prevent overflow
    }
}

//10 - Switch cases
let totalScenarios = 3

switch totalScenarios {
case 0:
    print ("first scenarios")
case 1:
    print ("second scenarios")
case 2:
    print ("third scenarios")
case 3:
    print ("fourth scenarios")
default:
    print ("Unprescedented scenarios")
}

let transaction = 6

switch transaction {
case 0...1:
    print ("Amazon")
case 2:
    print ("Ebay")
case 3:
    print ("Walmart")
default:
    print("Other shopping stores")
}
