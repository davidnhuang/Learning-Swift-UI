import UIKit

// Function does something - allows you to avoid repeating code

func printHelp() {
    let message = """
    Welcome to my app!
    
    Run this app inside a folder of images
    """
    
    print(message)
    
}

// Customize your function with parameters

func square(number: Int) {
    let output = number * number
    print (output)
}

square(number: 20)

// Trying another one
// This is how you pass parameters into a function
func additionExpression(firstInt: Int, secondInt: Int, statement: String) {
    let expressionOutput = firstInt + secondInt
    print ("\(statement)\(expressionOutput)")
}

additionExpression(firstInt: 20, secondInt: 182, statement: "The added expression outputs ")

// Returning value / output of a function
// Return ends the function

func addingTwoValues(first: Int, second: Int) -> Int {
    return first + second
}

let result = addingTwoValues(first: 2, second: 3)

print (result)

// IMPORTANT
// Omitting parameters
// Notice how you still need to label it in the function, but when calling it, you don't need to type the label person - this is what the _ is for
func greet(_ person: String) {
    print("Hello \(person)")
}

greet("Harry")

// Default parameters, assigning the parameter nice, a boolean, to true
func niceGreet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello there, \(person)")
    } else {
        print("Oh...hi \(person)")
    }
}

// This outputs a nice greeting
niceGreet("Erica")

// This outputs a not nice greeting
niceGreet("Mike", nicely: false)

// IMPORTANT
// Variadic function - means they accept any number of the SAME type of input
// variadic function will do the same tasks for a variety of inputs
func squareDifferentValues(numbers: Int...) {
    for number in numbers {
        print (number)
        print (numbers.count) // will loop 3 times because there are 3 values in the array
        let result = number * number
        print("Square of \(number) is \(result)")
    }
}

// Let's try to understand
// numbers is the list of values that the for loop will loop through
// number passes the value in the range position

squareDifferentValues(numbers: 5, 13, 27)

//Throwing function - when something goes wrong

// define an enum of error types that throws the function

// Error type is required for throws
enum passwordError: Error {
    case obvious
    case tooShort
}

// So this function outputs a boolean
// If the conditions meet, throws the enum case - else return true
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" || password == "12345" {
        throw passwordError.obvious
    } else if password.count <= 5 {
        throw passwordError.tooShort
    } else {
        return true
    }
}

// This password is valid
try checkPassword("dopetasticD")

// This password is too short - but swift hates this
// try checkPassword("hello")

let changedPassword: String = "1022999"

// Use do catch instead
do {
    try checkPassword(changedPassword)
    print ("Saved!")
} catch {
    print("This password is not valid")
}

// Default parameters are constants when passed in -
// However, if you want a parameter to change and return, use inout

func doubleInPlace(number: inout Int) {
    // Doubles the number
    number *= 2
}

// Notice how inout functions don't need -> output return
// You cannot inout constants because constants can't be changed, so you must use var

var valueToDouble = 10
doubleInPlace(number: &valueToDouble)
