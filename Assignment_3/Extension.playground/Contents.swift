import UIKit

/*An extension in Swift is used to add functionality to existing classes, structures, enumerations, or protocols. It allows you to add new methods, computed properties, initializers, and more to a type without modifying the original implementation.*/

// Extension to add a method that checks if an array is empty or not
extension Array{
    func isEmptyOrNot() -> String{
        return self.isEmpty ? "Array is Empty" : "Arrya is not Empty"
    }
}

let arr:[String] = []
print(arr.isEmptyOrNot())

let names = ["Alice","John","Sam"]
print(names.isEmptyOrNot())

print()

// Rectangle class definition with properties for width and height
class Rectangle{
    var width: Double
    var height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func rect(){
        print("Width: \(self.width) and Height: \(self.height)")
    }
}

extension Rectangle{
    func area() -> Double{
        return width * height
    }
    
    func perimeter() -> Double{
        return 2 * (width + height)
    }
    
}

let rectangle = Rectangle(width: 5, height: 3)
rectangle.rect()
print("Area:\(rectangle.area())")
print("Perimeter:\(rectangle.perimeter())")

