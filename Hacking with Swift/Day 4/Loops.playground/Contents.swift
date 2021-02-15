import UIKit

// Loops - run through code until conditions become false

// FOR LOOP
// Range
let range = 1...10 // from 1 to 10, includes 10

for num in range {
    print("Number is \(num)")
}

// You can also loop through an array
let set: [Int] = [1, 2, 3]

for num in set {
    print("Current number is \(num)")
}

// if you don't have a constant in the loop, use _ so there are no unneccesary values created
for _ in 1...5 {
    print ("printing 5 times")
}

// WHILE LOOP
var count = 1

while count <= 10 {
    print (count)
    count += 1
}
// Notice that this code won't run until the while loop is false
print ("Ready or not, here I come!")

// REPEAT LOOP
// Like a while loop, but the condition is at the end - this gauruntees that the code will be run at least once

repeat {
    print("running loop")
} while count <= 10

// notice how the repeat runs once, even though the previous while loop has already iterated through all 10

var newCount = 1

repeat {
    print(newCount)
    newCount += 1
} while newCount <= 4

// EXIT OUT OF LOOPs
var countdown = 10

while countdown <= 10 {
    print ("T minus \(countdown)")
    countdown -= 1
    
    if countdown == 4 {
        print ("Early launch")
        break
    }
    
}
print ("Blast off!")
// For while loops, please don't forget to include code that iterates the count - or else it will run for ever

// Exiting multiple loops - exit out parent loop to end all loops nested within

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print (product)
        
        if product == 50 {
            print ("breaking outer loop here")
            break outerLoop
        }
    }
}

// You can also skip specific items / conditions using Continue
for count in 1...10 {
    
    // Check if the current count is even and skips it
    if count % 2 == 0 {
        continue
    }
    
    print (count)
    
}

// Infinite loops
var time = 0

while true {
    
    // Infinite loop
    print(" ")
    time += 1
    
    // Exit condition - THIS IS VERY IMPORTANT
    if time == 5000 {
        print("*gasp")
        break
    }
    
}
