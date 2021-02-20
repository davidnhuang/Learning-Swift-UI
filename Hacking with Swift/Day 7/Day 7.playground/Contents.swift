import UIKit

// Passing closures that accept its own parameters
func travel(action: (String) -> Void) {
    print ("I'm traveling...")
    action("London")
    print ("I arrived!")
}

// This is how to call the function
travel { (place: String) in
    print("I'm going to \(place)")
}

//Return a value
func travelReturn(place: (String) -> String) {
    print("I'm getting ready to go.")
    let description = place("London")
    print(description)
    print("I've arrived")
}

travelReturn { (place: String) in
    return "I'm going to \(place) in my car"
}

// or
travelReturn { place in
    "I'm going to \(place) in my car"
}

// or
travelReturn {
    "I'm going to \($0) in my car"
}

// Multiple parameters
func travelingToMultiple(action: (String, Int) -> String ) {
    print ("I'm getting ready to go.")
    let place = action("London", 60)
    print (place)
    print("I arrived!")
}

// Return closures from function
func returnClosure() -> (_ location: String) -> Void {
    return { location in
        print("I'm going to \(location)")
    }
}

let result = returnClosure()
result("HERE")

// Or
// let result2 = returnClosure()("London")

// Capturing values
// Swift is able to capture values created inside the closure

func capturingValues() -> (_ input: String) -> Void {
    var counter = 1
    return { input in
        print("\(counter) - Closure \(input)")
        counter += 1
    }
}

let capturedValue = capturingValues()
capturedValue("Capture")
capturedValue("Capture")
capturedValue("Capture")
