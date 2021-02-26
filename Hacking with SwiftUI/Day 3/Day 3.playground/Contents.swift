import UIKit

let firstScore = 12
let secondScore = 4

// Basic math operators
let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let divided = firstScore / secondScore

// Special
let remainder = 13 % secondScore // This will output 1

// Joining strings
let person = "David"
let action = person + " says hi"

// Joining arrays
let firstHalf = ["John", "Jane"]
let secondHalf = ["Don", "Donna"]
let all = firstHalf + secondHalf

// Compound assignment
var score = 95

// Take away 5 and return difference
score -= 5 // this will return 90

// Add 5 and return sum
score += 5 // this will return 95

// You can also do this with strings
let numberOfCats = 5
let units = "cats"
var statement = "There are \(numberOfCats) "
statement += units

// Comparison operators - returns a boolean
let firstValue = 6
let secondValue = 4

// Are these the same?
firstValue == secondValue // This is false
firstValue != secondValue // This is true

// Is the first greater or less than the second?
firstValue < secondValue // This is false
firstValue > secondValue // This is true

// Greater / less than or equal?
let thirdValue = 6
firstValue <= thirdValue // This is true
firstValue >= thirdValue // This is also true

// You can also do this with strings
"Donny" == "Danny" // This is false
"Donny" == "Donny" // This is true

//Conditionals - IMPORTANT!
// if something is true

let firstCard = 11
let secondCard = 10

enum blackJack {
    case Win
    case Bust
    case Lose
}

// If the sum of first and second card is exactly 21
if firstCard + secondCard == 21 {
    print(blackJack.Win)
}

let thirdCard = 12
let dealerCards = 19

if firstCard + thirdCard > 21 {
    print(blackJack.Bust)
}

// Or we can combine it into one
if firstCard + secondCard == 21 {
    blackJack.Win
} else if firstCard + secondCard > 21 {
    blackJack.Bust
} else if firstCard + secondCard < dealerCards {
    blackJack.Lose
}
// This results in a win, since first and second card is equal exactly to 21

// Combining comparisons - SUPER IMPORTANT!!

// && this means AND
// || this means OR

let firstAge = 12
let secondAge = 16

if firstAge > 18 && secondAge > 18 {
    print("Both are over 18")
}

if firstAge < 18 || secondAge < 18 {
    print("At least one of the two are under 18")
}

// Ternary operator - SUPER IMPORTANT!! Rarely used since it's hard to read

let firstHand = 5
let secondHand = 5

// What it means below is basically saying IF the 2 values are the same, print the first thing after ?, ELSE, print after :
print(
    firstHand == secondHand ? "Hands are the same" : "Hands are different"
)

// The longer but more readable version is below
if firstHand == secondHand {
    print("Hands are the same")
} else {
    print("Hands are different")
}

// Switch statements - similar to the option picker in origami
// Use if there are severate if else statements

let weather = "sunny"

switch weather {
case "sunny": print("wear sunscreen"); fallthrough // fall through means skip to next case
    case "cloudy": print("bring jacket")
    case "raining": print("bring umbrella")
    default: print("Enjoy your day")
}

// Range operator - SUPER IMPORTANT!
// ..< up to and excludes final value
// ... up to and includes final value

let testScore = 70

switch testScore {
case 0..<50:
    print("Low score")
case 50...70:
    print("Average")
case 71...89:
    print("Proficient")
case 90...100:
    print("High score")
default: print("still grading")
}
