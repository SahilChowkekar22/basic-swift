import UIKit

/* Optional Chaining in Swift is a powerful feature that allows you to call properties, methods, and subscripts on optional values safely. It helps avoid runtime crashes by checking if the optional contains a value before trying to access it. If the optional is nil, the operation fails gracefully and returns nil instead of causing an error*/

struct Address {
    var street: String
    var city: String
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String, address: Address?) {
        self.name = name
        self.address = address
    }
}

let person1 = Person(name: "Alice", address: nil)

let person2 = Person(name: "Bob", address: Address(street: "123 Swift St", city: "Cupertino"))

if let streetName = person1.address?.street{
    print("Alice's Street: \(streetName)")
} else {
    print("Alice has no address.")
}

// Using Optional Chaining for Bob
if let streetName = person2.address?.street {
    print("Bob's Street: \(streetName)")
}
