import UIKit

/* - Generics allow you to write generic types and generic functions.
 - You define placeholders for types, and when using them, you specify the actual types that replace those placeholders.
 - Generics help you avoid code duplication and work with many different types in a type-safe manner.
*/

// Define a generic class 'Pair' that takes two types T and U
class Pair<T,U> {
    var first: T
    var second: U
    
    init(first: T, second: U) {
        self.first = first
        self.second = second
    }
    
    func getFirst() -> T {
        return first
    }
    
    func getSecond() -> U {
        return second
    }
}

// Create an instance of the 'Pair' class, where T is Int and U is String
let pair1 = Pair(first: 20, second: "John")
print("First: \(pair1.getFirst())")
print("Second: \(pair1.getSecond())")

// Create another instance of the 'Pair' class, where T is Double and U i
let pair2 = Pair(first: 3.10, second: true)
print("First: \(pair1.getFirst())")
print("Second: \(pair1.getSecond())")



