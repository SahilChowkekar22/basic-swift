import UIKit

/* In Swift, COW (Copy-On-Write) is an optimization technique used to improve performance and memory efficiency when working with value types, such as Array, Dictionary, and Set.
  -  Swift collections (like Array, Dictionary, and Set) use reference counting under the hood.
  - When you assign a collection to another variable, it does not immediately create a new copy. Instead, both variables reference the same underlying storage.
  - If one of the variables modifies the collection, Swift creates a new copy, ensuring that modifications do not affect the original.
 */

var str1 = "Hello"
var str2 = str1

print("Before modification")
print("str1: \(str1)")
print("str2: \(str2)")

str2.append(", World!")
print("str1: \(str1)")
print("str2: \(str2)")

print()

// Using a Value Type (Struct)
struct Person{
    var name: String
    var age: Int
}

var person1 = Person(name: "Alice", age: 30)
var person2 = person1

print("Before modification")
print("person1: \(person1)")
print("person2: \(person2)")

person2.name = "John"

print("\nAfter Modification")
print("person1: \(person1)")
print("person2: \(person2)")

//Using a Reference Type (Class)
class People{
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    }

let people3 = People(name: "Bob", age: 25)
var people4 = people3

print("\nBefore modification")
print("people3: \(people3.name)")
print("people4: \(people4.name)")

people4.name = "Jane"

print("\nAfter Modification")
print("people3: \(people3.name)")
print("people4: \(people4.name)")

