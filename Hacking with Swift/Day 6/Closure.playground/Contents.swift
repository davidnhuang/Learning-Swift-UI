import UIKit

// Closure is basically a function that is assigned as a varible - it is written a little differently, but can be passed around like a variable

let driving = {
    print("I'm driving in my car")
}

// Notice how, in this case, because this is a closure, you have to put the () next when you call it
driving()

// To accept parameters inside a closure - you have to do a different syntax

let drivingTo = { (place: String) in
    print("I'm going to \(place)")
}

drivingTo("London")

// To return values in a closure
let goingTo = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let returnMessage = goingTo("home")
print (returnMessage)

// Passing closures as parameters

let drivingAsPar = {
    print("I'm driving in my car")
}

func travel(by action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I've arrived")
}

travel(by: drivingAsPar)

// With closures, since you're not using func, you have to do some setting up and extra syntax so it works like a function

// Trailing closure
// If the last parameter of your function is a closure, you can use this special syntax

func travelActions(action: () -> Void) {
    print ("I'm getting ready to go")
    action()
    print("arrived")
}

travelActions() {
    print("traveling")
}

// or

travelActions {
    print("traveling")
}

// You see, this looks very similar to the NavigationView{} or the List{} and the many SwiftUI fuctions - they are all functions that have trailing closures
