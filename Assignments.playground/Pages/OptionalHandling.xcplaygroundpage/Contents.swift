//: [Previous](@previous)
import Foundation

// Declaring an optional integer variable
var num: Int?

// Assigning a value to `num` (Uncomment to test with a valid number)
// num = 34

// Setting `num` to nil (It means the variable has no value)
num = nil

// Using optional binding (if let) to safely unwrap `num`
if let x = num {
    print("Value is \(x)")
} else {
    print("Value is unknown") // Executes if `num` is nil
}

// Declaring an optional string variable
var name: String?

// Assigning a value to `name` (Uncomment to test with a valid string)
// name = "John"

// Setting `name` to nil
name = nil

// Directly printing `name` will show "Optional(nil)" warning
print("My name is \(name)")

// Function to display name using `guard let` for safe unwrapping
@MainActor func display() {
    guard let newName = name else {
        print("Unknown name") // Executes if `name` is nil
        return
    }
    print("My name is \(newName)") // Runs only if `name` has a value
}

// Calling the display function
display()

// Using nil-coalescing operator (`??`) to provide a default value
print("Name is \(name ?? "Unknown value")") // Prints "Unknown value" if `name` is nil

// Assigning a valid string to `name`
name = "swift"

// Force unwrapping (⚠️ Use with caution, crashes if `name` is nil)
print("Name is \(name!)") // Safe here because `name` is assigned a value
