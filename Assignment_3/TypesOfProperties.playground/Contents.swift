import UIKit

class Employee {
    
    // Stored Properties (Directly store values in memory)
    var firstName: String
    var lastName: String
    var hourlyRate: Double
    var hoursWorked: Double
    
    // Lazy Property (Only initialized when accessed for the first time)
    lazy var fullName: String = {
        print("Calculating full name..")
        return "\(firstName) \(lastName)"
    }()
    
    // Computed Property (Dynamically calculates value instead of storing it)
    var salary: Double {
        return hourlyRate * hoursWorked
    }
    
    
    init(firstName: String, lastName: String, hourlyRate: Double, hoursWorked: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.hourlyRate = hourlyRate
        self.hoursWorked = hoursWorked
    }
}


let e1 = Employee(firstName: "John", lastName: "D", hourlyRate: 56.0, hoursWorked: 40)

// Accessing Computed Property (Salary is calculated dynamically)
print("Salary: $\(e1.salary)")

// Accessing Lazy Property (fullName is computed only once when accessed for the first time)
print("Employee Full name: \(e1.fullName)")


// Changing a Stored Property (Modifying firstName)
e1.firstName = "Sam"

// Accessing Lazy Property Again (Since lazy properties don't update automatically, fullName remains "John D")
print("Employee Full name: \(e1.fullName)")

