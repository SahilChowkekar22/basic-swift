import UIKit

/* Associated types are a powerful feature of Swift's protocols that allow protocols to define a placeholder type, which is determined when the protocol is adopted. This makes protocols more generic and flexible. */

protocol Container {
    associatedtype Item
    func displayItem()
    func calculateSize() -> Item
}
struct IntContainer: Container {
    var a:Int = 0
    typealias Item = Int
    func displayItem() {
        print("Displaying an Int")
    }
    func calculateSize() -> Item {
        return a * 2
    }
}
struct StringContainer: Container {
    var str:String = ""
    typealias Item = String
    func displayItem() {
        print("Displaying a String")
    }
    func calculateSize() -> Item {
        return str + "is cool"
    }
}
struct DoubleContainer: Container {
    var d:Double = 0
    typealias Item = Double
    func displayItem() {
        print("Displaying a Double")
    }
    func calculateSize() -> Item {
        return d * 1.5
    }
}

let intContainer = IntContainer(a: 5)
let stringContainer = StringContainer(str: "Hello ")
let doubleContainer = DoubleContainer(d: 3.14)

intContainer.displayItem()
print("Calculation result: \(intContainer.calculateSize())")

stringContainer.displayItem()
print("Calculation result: \(stringContainer.calculateSize())")

doubleContainer.displayItem()
print("Calculation result: \(doubleContainer.calculateSize())")

