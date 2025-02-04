import UIKit

/* A closure in Swift is a self-contained block of functionality that can be passed around and used in your code. Closures can capture and store references to variables and constants from the surrounding context in which they are defined. Closures can take parameters and return values, just like functions, but they have the advantage of being flexible and lightweight.
 
 Closures are often used for tasks like asynchronous operations, event handling, and passing blocks of code as arguments to functions.*/

let addNumbers: (Int,Int) -> Int = { (a,b) in
    return a + b
}

let result = addNumbers(3,4)
print(result)

print()

/* Non-Escaping Closure - A non-escaping closure is a closure that is guaranteed to execute within the scope of the function it is passed to. The closure does not "escape" the function, meaning it must execute before the function returns.

*/

func doWork(closure:() -> Void){
    print("Before Closure")
    closure()
    print("After Closure")
}

doWork{
    print("Closure executed")
}


print()

/* Escaping Closure - An escaping closure is a closure that may outlive the function it was passed into. This means the closure can be executed after the function returns, for example, when it's stored or passed to another object.

*/

func delayedWork(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        completion()      }
    print("Work Initiated")
}

delayedWork {
    print("Closure executed after 2 seconds")
}

print()

/* Trailing closure - Trailing closures allow you to write closures outside of the function's parentheses when they are the last argument passed to a function. This can make the code more readable, especially when the closure is long. */

func performOperation(a: Int, b:Int, operation:(Int) -> Void){
    let mul = a * b
    operation(mul)
}

performOperation(a: 20, b: 20){
    result in print("Multplication of two numbers: \(result)")
}

print()

/* Autoclosure - An autoclosure automatically creates a closure from an expression passed to a function. This is useful when you want to delay the evaluation of an expression until the closure is actually called.*/

func checkCondition(completion: () -> Void) {
    print("Inside the closure")
    completion()
}

checkCondition(){
    print("Completion block executed")
}



