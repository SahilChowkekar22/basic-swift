import UIKit

// 1. Function without Parameters: Display a message
func displayMessage(){
    print("First Line")
    print("Second Line")
}

displayMessage()

// 2. Function with Parameters: Display name and age
func displayMessage2(name: String, age: Int){
    print("My name is \(name) and I am \(age) years old")
}

displayMessage2(name: "Sam", age: 32)
displayMessage2(name: "Alex", age: 33)

// 3. Function with Return Type: Add two numbers and return the result
func addNum(_ num1: Int,_ num2: Int) -> Int{
    let add = num1 + num2
    return add
}

let result = addNum(10, 20)
print("Result is \(result)")

// 4. Function with Inout Parameter: Modify a number in place (by reference)
func numSquare(num: inout Int){
    num = num * num
}

var num = 40
numSquare(num: &num)
print("Result is \(num)")

// 5. Tuple: Store multiple values in a single variable and access them by index
let product = ("Macbook", 1499.99, true)

print(product.0) // "Macbook"
print(product.1) // 1499.99
print(product.2) // true

// 6. Function Returning a Tuple: Return multiple values (name, age) from a function
func getValue() -> (String, Int){
    return ("Alice", 23)
}

let r = getValue()
print("Name: \(r.0), Age: \(r.1)")
