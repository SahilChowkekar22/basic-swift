import UIKit

/* A protocol in Swift defines a blueprint for methods, properties, and other requirements that suit a particular task or piece of functionality. Classes, structures, and enumerations can then adopt and conform to these protocols to provide specific implementations for the required functionalit*/

protocol Discountable {
    var discount: Double { get }
    mutating func applyDiscount(price: Double) -> Double
}

protocol Taxable {
    var taxRate: Double { get }
    func calculateTax(price: Double) -> Double
}

struct Product: Discountable, Taxable {
    var price: Double
    var discountPercentage: Double
    var taxRate: Double
    
    var discount: Double {
        return price * (discountPercentage / 100)
    }
    
    mutating func applyDiscount(price: Double) -> Double {
        self.price = self.price * 2
        print("New price: \(self.price)")
        print("Old price: \(price)")
        return price - discount
    }
    
    func calculateTax(price: Double) -> Double {
        return price * (taxRate / 100)
    }
    
}

class Service: Discountable, Taxable {
    var price: Double
    var discountPercentage: Double
    var taxRate: Double
    
    init(price: Double, discountPercentage: Double, taxRate: Double) {
        self.price = price
        self.discountPercentage = discountPercentage
        self.taxRate = taxRate
    }
    
    
    
    var discount: Double {
        return price * (discountPercentage / 100)
    }
    
    func applyDiscount(price: Double) -> Double {
        return price - discount
    }
    
    func calculateTax(price: Double) -> Double {
        return price * (taxRate / 100)
    }
}


var product = Product(price: 200.0, discountPercentage: 10.0, taxRate: 8.0)
print("Product original price: \(product.price)")
print("Product discount: \(product.discount)")
print("Price after discount: \(product.applyDiscount(price: product.price))")
print("Tax: \(product.calculateTax(price: product.price))")



let service = Service(price: 500.0, discountPercentage: 20.0, taxRate: 10.0)
print("\nService original price: \(service.price)")
print("Service discount: \(service.discount)")
print("Price after discount: \(service.applyDiscount(price: service.price))")
print("Tax: \(service.calculateTax(price: service.price))")

