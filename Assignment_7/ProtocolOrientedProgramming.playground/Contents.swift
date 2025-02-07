import UIKit

/*  POP- Portocol Oriented Programming
 
 - POP prometes use of protocols and protocol extension to provide default implemantion and behaviour over inheritance of classes
 - POP encourages composition using multiple protocols rather class inheritance
 - POP align well with Swifts empahsis on value types, structs, enum
 - Protocols can inherite multiple portocols at same time
 - we achive highly modular and composable code that is easy to maintain, loosly coupled and extend and test as well
 
 
*/

//  1. default implemantion and behaviour

protocol Logger{
    func log(message: String)
}

extension Logger{
    func log(message: String) {
        print("Log: \(message)")
    }
}

struct ConsoleLogger:Logger {}

let defaultLogger = ConsoleLogger()
defaultLogger.log(message: "Hello World")

struct FileLogger: Logger {
    func log(message: String) {
        print("Logging to file: \(message)")
    }
}

let fileLogger = FileLogger()
fileLogger.log(message: "Saving this log to a file.")

// 2.Multiple Protocol Conformance
protocol Walkable {
    func walk()
}

protocol Talkable {
    func talk()
}

extension Walkable {
    func walk() {
        print("Walking using default behavior.")
    }
}

class Robot: Walkable, Talkable {
    func talk() {
        print("Talking like a robot.")
    }
}

let myRobot = Robot()
myRobot.walk()
myRobot.talk()  

print()
// 3. Protocol with associated Types
protocol Storage {
    associatedtype Item
    func store(item: Item)
    func retrieve() -> Item
}


struct Box<T>: Storage {
    typealias Item = T
    private var item: T
    
    init(item: T) {
        self.item = item
    }
    
    func store(item: T) {
        print("Storing item: \(item)")
    }
    
    func retrieve() -> T {
        return item
    }
}


let intBox = Box(item: 42)
print("Retrieved:", intBox.retrieve())

let stringBox = Box(item: "Hello")
print("Retrieved:", stringBox.retrieve())

print()
//4. Protocol use for depedancy injection
protocol DataService {
    func fetchData() -> String
}

struct APIService: DataService {
    func fetchData() -> String {
        return "Data from API"
    }
}

struct MockService: DataService {
    func fetchData() -> String {
        return "Mocked Data for Testing"
    }
}

class DataManager {
    private let service: DataService
    
    init(service: DataService) {
        self.service = service
    }
    
    func getData() {
        print(service.fetchData())
    }
}


let apiManager = DataManager(service: APIService())
apiManager.getData()

let mockManager = DataManager(service: MockService())
mockManager.getData()

print()
//5 Protocol Inheritance
protocol Printer {
    func printDocument()
}


protocol Scanner {
    func scanDocument()
}


protocol MultiFunctionDevice: Printer, Scanner {
    func faxDocument()
}

print()
// Class conforming to MultiFunctionDevice, which means it must implement all three methods
class OfficeMachine: MultiFunctionDevice {
    func printDocument() {
        print("Printing document...")
    }
    
    func scanDocument() {
        print("Scanning document...")
    }
    
    func faxDocument() {
        print("Faxing document...")
    }
}

let machine = OfficeMachine()
machine.printDocument()
machine.scanDocument()
machine.faxDocument()
