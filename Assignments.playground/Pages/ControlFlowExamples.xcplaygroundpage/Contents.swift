// 1. If-Else Condition: Check if the age is 18 or older
let age = 18

if age >= 18 {
    print("You are an adult")
} else {
    print("You are a minor")
}

// 2. If-Else If-Else Condition: Check the grade based on the score
let score = 85

if score >= 90 {
    print("Grade: A")
} else if score >= 80 {
    print("Grade: B") // Output: Grade: B
} else {
    print("Grade: C")
}

// 3. Switch Case: Check the grade based on marks using a switch statement
let marks = 75

switch marks {
case 90...100:
    print("Grade A")
case 70..<80:
    print("Grade B")
default:
    print("Grade C")
}

// 4. Guard Statement: Check if the name is provided or not, using optional binding
func greet(name: String?) {
    guard let validName = name else {
        print("Name is missing")
        return
    }
    
    print("Name: \(validName)")
}

greet(name: "John")
greet(name: nil)

// 5. For-In Loop: Iterate over an array of numbers and print each value
let numbers = [2, 3, 1, 4, 1]
for num in numbers {
    print(num)
}

// 6. For-In Loop with Range: Iterate through a range of numbers
for i in 1...5 {
    print("Count: \(i)")
}

// 7. While Loop: Countdown from 3 to 1
var count = 3

while count > 0 {
    print("Countdown: \(count)")
    count -= 1
}

// 8. For-In Loop with Break: Stop the loop when i equals 3
for i in 1...5 {
    if i == 3 {
        break
    }
    print(i)
}

// 9. For-In Loop with Continue: Skip printing when i equals 3
for i in 1...5 {
    if i == 3 {
        continue
    }
    print(i)
}
