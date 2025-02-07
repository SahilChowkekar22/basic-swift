import UIKit

/* An enum (short for enumeration) is a user-defined data type that groups related values together in Swift.
   It is commonly used for managing state, handling options, and improving code readability. */

// Enum with Raw Values
/*
   In Swift, an enum with raw values assigns a default value (like Int, String, or Double) to each case.
   This allows cases to be initialized using their raw values.
   We define the raw type by specifying the type (e.g., `Int`) after the colon in the enum declaration.
   Raw values can be used to initialize enum cases from an integer or string.
*/

enum StatusCode: Int {
    case success = 200
    case notFound = 404
    case internalServerError = 500
    
    // This function returns a description for the status code based on the enum case
    func description() -> String {
        switch self {
        case .success:
            return "Request was successful"
        case .notFound:
            return "Resource not found"
        case .internalServerError:
            return "Internal Server Error"
        }
    }
}

let status = StatusCode(rawValue: 100)
print(status?.description() ?? "Unknown status code")

print()

/* Enum with Associated Values
   - In Swift, an enum with associated values allows each case to store different types of values.
   - Unlike raw values, where each case has a fixed predefined value, associated values enable dynamic data storage for each case.
   - For example, a 'car' can have a brand and a number of seats, while a 'bicycle' can have a brand and a number of gears.
*/

enum Transport {
    case car(brand: String, seats: Int)
    case bicycle(brand: String, gearCount: Int)
    case walking(distance: Double)
}

// Function to describe the 'Transport' type
func describeTransport(_ transport: Transport) {
    switch transport {
    case .car(let brand, let seats):
        print("I drive a \(brand) with \(seats) seats")
    case .bicycle(let brand, let gearCount):
        print("I ride a \(brand) with \(gearCount) gears")
    case .walking(let distance):
        print("I walk \(distance) km")
    }
}

// Creating instances of the 'Transport'
let myCar = Transport.car(brand: "Toyota", seats: 5)
let myBike = Transport.bicycle(brand: "Specialized", gearCount: 7)
let meWalk = Transport.walking(distance: 2.5)

// Calling the 'describeTransport' function with each 'Transport' instance
describeTransport(myCar)
describeTransport(myBike)
describeTransport(meWalk)
