import UIKit

/* Dependency Injection (DI) is a design pattern used in software development where dependencies (objects on which a class depends) are provided from the outside rather than being created within the class itself. This promotes loose coupling, better testability, and easier maintenance.
 
 Types of Dependency Injection
  - Constructor Injection - Dependencies are passed via the initializer (constructor).
  - Property Injection - Dependencies are assigned to properties after object creation.
  - Method Injection - Dependencies are passed as method parameters when needed*/


class Engine{
    
    func start() -> String{
        return "Engine started"
    }
}

class MusicSystem{
    func playMusic() -> String{
        return "Music played!"
    }
}

class Car{
    let engine: Engine // Constructor Injection
    
    var musicSystem: MusicSystem? // property injection
    
    init(engine: Engine){
        self.engine = engine
    }
    
    func drive(navigationSystem:String){
        print(engine.start())
        if let system = musicSystem {
            print(system.playMusic())
        }else {
            print("No Music System Installed")
        }
        print("Using \(navigationSystem) for navigation")
    }
}

let engine = Engine()
let car = Car(engine: engine) // Constructor Injection

let musicSystem = MusicSystem()
car.musicSystem = musicSystem // Property Injection

car.drive(navigationSystem: "Google Maps") // Method Injection
