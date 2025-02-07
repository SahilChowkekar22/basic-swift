import UIKit

// 1. Stack Memory - It stores value types (struct, enum, primitives) with fast, automatic allocation/deallocation and pass-by-value behavior in Swift.

struct Person {
    var name: String
}

var person1 = Person(name: "Alice")
var person2 = person1
person2.name = "Bob"

print(person1.name)
print(person2.name)

/* 2. Heap Memory (Reference Types) - classes, clousure, Actors
 - Used for storing reference types, such as class instances.
 - Memory is dynamically allocated, and ARC manages deallocation.
 - Multiple references can point to the same object (pass-by-reference behavior).
 - Slower than stack due to dynamic allocation and reference counting. */

// Strong Reference – The default reference type that increases the reference count, keeping the object alive.
// Weak Reference – A reference that does not increase the reference count, allowing the object to be deallocated
// Unowned Reference – A non-optional reference that does not increase the reference count and assumes the object will always exist. it same like weak but if unowned is nil it will crash your code

class Owner{
    var name: String
    var pet: Pet? //strong reference to Pet
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is deallocated")
    }
}

class Pet{
    var name: String
    weak var owner: Owner? //weak reference to avoid retain cycle
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is deallocated")
    }
}

class House{
    var address: String
    unowned var owner: Owner //unowned reference assumes owner always exists
    
    init(address: String, owner: Owner) {
        self.address = address
        self.owner = owner
    }
    
    deinit {
        print("House at \(address) is deallocated")
    }
}

var owner: Owner? = Owner(name: "Alice")
var pet: Pet? = Pet(name: "Buddy")
var house: House? = House(address: "123 Main St", owner: owner!)

owner?.pet = pet  // Strong reference from Owner to Pet
pet?.owner = owner // Weak reference from Pet to Owner
house = nil        // House is deallocated, but owner remains

owner = nil  // Owner is deallocated, breaking all references
pet = nil    // Pet is deallocated

