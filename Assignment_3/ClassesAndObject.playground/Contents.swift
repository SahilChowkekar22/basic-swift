import UIKit

// Definition of the base class 'Car'
class Car {
    var brand: String
    var speed: Int
    
    // Initializer to set up the car with a brand and speed
    init(brand: String, speed: Int) {
        self.brand = brand
        self.speed = speed
    }
    
    // Method to simulate driving the car
    func drive() {
        print("\(self.brand) is driving at \(self.speed) km/h")
    }
}

// Creating an instance of Car
let c1 = Car(brand: "Toyota", speed: 100)
c1.drive()


// Definition of the subclass 'ElectricCar' which inherits from Car
class ElectricCar: Car {
    var batteryLevel: Int

    // Initializer for ElectricCar that includes the battery level along with brand and speed
    init(brand: String, speed: Int, batteryLevel: Int) {
        self.batteryLevel = batteryLevel
        super.init(brand: brand, speed: speed)      }
    
    // Method to check if the battery needs charging
    func chargeBattery() {
        
        if batteryLevel < 10 {
            print("Battery needs to be charged for \(brand)")
        } else {
            print("Battery level is sufficient at \(batteryLevel)% for \(brand), no need to charge")
        }
    }
}

let t1 = ElectricCar(brand: "Tesla", speed: 300, batteryLevel: 2)
t1.chargeBattery()
