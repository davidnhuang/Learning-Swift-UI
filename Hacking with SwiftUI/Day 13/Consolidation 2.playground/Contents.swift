import UIKit

// FUNCTIONS
func favoriteAlbum() {
    print("My favorite is This")
}
favoriteAlbum()

func favoriteColor(color: String) {
    print ("my favorite color is \(color)")
}
favoriteColor(color: "Blue")

// Functions taking parameters
func countLettersInString(string: String) {
    print("\(string) has \(string.count) characters.")
}
countLettersInString(string: "Bonjour")

// External parameter labels
func addingTwoIntegers(firstInt: Int, secondInt: Int) {
    let result = firstInt + secondInt
    print (result)
}
addingTwoIntegers(firstInt: 2, secondInt: 5)

// No parameter label
func multiplyBy2(_ int: Int) {
    let result = int*2
    print (result)
}
multiplyBy2(2)

// Internal & external labels
func joiningTwoSentences(prior first: String, next second: String) {
    print (first + second)
}
joiningTwoSentences(prior: "I ", next: "am David")

// Return value from Function
func passwordMatch(input: String) -> Bool {
    if input == "password" {
        return true
    } else {
        return false
    }
}

func passwordValidation(match: Bool) {
    print ("Validating...")
    if match == true {
        print ("Access granted")
    } else {
        print ("Access denied")
    }
}

// Nesting function in functions - this is bad practice
passwordValidation(match: passwordMatch(input: "password")) // valid
passwordValidation(match: passwordMatch(input: "12345")) // invalid

//OPTIONALS - might have a value
func isCustomerSatisfied(source input: Int) -> Bool? {
    if input >= 3 {
        return true
    } else if input == 0 {
        return false
    } else {
        return nil
    }
}

let firstCustomerResponse: Int
firstCustomerResponse = 3
isCustomerSatisfied(source: firstCustomerResponse) // true

let secondCustomerResponse: Int
secondCustomerResponse = -1
isCustomerSatisfied(source: secondCustomerResponse) // nil

// A better example
// Allow customer to move on to next step after input
func getCustomerEmail(input email: String) -> Bool? {
    if email.count > 0 {
        return true
    } else {
        return nil
    }
}
getCustomerEmail(input: "") // nil - no input
getCustomerEmail(input: " ") // can continue
getCustomerEmail(input: "jon@doe.com") // can continue

// Example
func yearAlbumReleased(name: String) -> Int? {
    // If the album is on record - return a number
    if name == "Album 1" {
        return 2001
    } else if name == "Album 2" {
        return 2005
    } else {
        // Not on record
        return nil
    }
}

if let checkingAlbum = yearAlbumReleased(name: "Album 3") {
    print ()
}
