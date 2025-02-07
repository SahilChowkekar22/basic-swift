import UIKit

/* An initializer in Swift is a special method that is called when an instance of a class, struct, or enum is created. Its primary purpose is to set up an object with initial values for its properties and prepare it for use. Initializers ensure that all properties are in a valid state before the object is used.
*/

/* default initializer - A default initializer is an initializer that Swift automatically provides for a struct or class if no custom initializers are defined. It initializes all properties with their default values.
 
    -  For structs, the default initializer is automatically provided when all properties have default values.
    -  For classes, Swift provides a default initializer if no custom designated initializers are provided and all properties have default values.
*/

class Car{
    var make = "Tesla"
    var model = "Model 5"
    var year = 2020
    
}

let defaultCar = Car()
print(defaultCar.make)
print(defaultCar.model)
print(defaultCar.year)

print()

/* memberwise initializer - A memberwise initializer is a special feature in Swift that automatically generates an initializer for structs that have properties without default values. The memberwise initializer allows you to initialize each property individually when creating an instance of the struct. This initializer is automatically provided by Swift for structs, but not for classes.
 
*/

struct Book{
    var titile: String
    var author: String
    var publicationYear: Int?
    
    
}

let book1 = Book(titile: "The Alchemist", author: "Paulo Coelho", publicationYear: 1988)
print("Book Title: \(book1.titile)")
print("Book Author: \(book1.author)")
print("Book Publication Year: \(book1.publicationYear)")

print()

let book2 = Book(titile: "To Kill a Mockingbird", author: "Harper Lee")
print("Book Title: \(book2.titile)")
print("Book Author: \(book2.author)")
print("Book Publication Year: \(book2.publicationYear)")

print()
/* convenience initializer - A convenience initializer is a secondary, more specialized initializer that must call a designated initializer in the same class (or superclass) to fully initialize an object. It allows you to provide additional flexibility or default values for object creation.
 
*/

class Rectangle{
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    convenience init(width: Double) {
        self.init(width: width, height: 40.00 )
    }
}

let rectangle1 = Rectangle(width: 100.00, height: 43.00)
print("Width: \(rectangle1.width)")
print("Height: \(rectangle1.height)")

let rectangle2 = Rectangle(width: 100.00)
print("Width: \(rectangle2.width)")
print("Height: \(rectangle2.height)")


/* failable initializer - A failable initializer is an initializer that can fail to initialize an object and return nil if certain conditions aren't met. This allows you to handle cases where an object cannot be created due to invalid or missing data.
 
*/

struct Person{
    var name: String
    var age: Int
    
    init?(name: String, age: Int){
        
        if age <= 0 {
            return nil
            }
        self.name = name
        self.age = age
    }
    
    func descrpition() -> String{
        return "Name: \(name), Age: \(age)"
    }
}

if let validPerson1 = Person(name: "John", age: 25){
    print(validPerson1.descrpition())
}else{
    print("Invalid age provided.")
}

if let validPerson2 = Person(name: "Jane", age: -10){
    print(validPerson2.descrpition())
}else{
    print("Invalid age provided.")
}


print()

/* A required initializer in Swift is an initializer that must be implemented by all subclasses of a class, regardless of whether the subclass provides its own custom initializers. The required keyword indicates that a class must implement the initializer.
 
  - A required initializer is typically used in a class to ensure that certain initialization behavior is enforced across all subclasses.
  - This applies only to classes (not structs or enums), since inheritance is only possible with classes in Swift.
*/

class Animal {
    var name: String
    
    // Required initializer
    required init(name: String) {
        self.name = name
    }
    
    func description() -> String {
        return "This is a \(name)."
    }
}

class Dog: Animal {
    var breed: String
    
        required init(name: String) {
        self.breed = "Unknown"
        super.init(name: name)
    }
}

let dog = Dog(name: "Buddy")
print(dog.description())

