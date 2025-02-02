import UIKit

/*
 A `struct` (short for structure) in Swift is a value type that groups related properties and methods
 into a single unit. Unlike classes, structs use copy-on-write behavior, meaning that
 when you assign a struct instance to another variable, it creates a new copy rather than
 sharing the reference.
 
 Key Characteristics of Structs:
    - Value Type (Stored in Stack Memory, Copies Data Instead of Sharing Reference)
    - Encapsulates Properties & Methods (Similar to a Class)
    - Does Not Support Inheritance (Unlike Classes)
    - Faster and Memory Efficient (Useful for Lightweight Data Models)
    - Requires `mutating` Keyword for Methods Modifying Properties
*/

struct Rectangle {
    
    var width: Double
    var height: Double
    
    var area: Double {
        return width * height
    }
    
    // Mutating Method (Allows modification of struct properties)
    mutating func resize(newWidth: Double, newHeight: Double) {
        self.width = newWidth  // Updating width
        self.height = newHeight // Updating height
    }
}

// Creating an instance of Rectangle
var rect = Rectangle(width: 5.0, height: 10.0)

// Accessing the computed property (Original area)
print("Original area: \(rect.area)")

// Modifying the rectangle dimensions using the mutating function
rect.resize(newWidth: 10.0, newHeight: 20.0)

// Accessing the computed property again (Updated area)
print("Resized area: \(rect.area)") 
