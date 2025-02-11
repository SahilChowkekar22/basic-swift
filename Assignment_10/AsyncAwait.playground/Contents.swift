import UIKit

/* Async/Await in Swift
async/await is a modern concurrency model introduced in Swift to handle asynchronous operations in a structured and readable manner. It allows developers to write asynchronous code that looks synchronous, improving readability and maintainability. */


enum NetworkError: Error {
    case failed
}

func fetchData() async throws -> String {
    let success = Bool.random()// Success/Failure
    if success {
        return "Data Received"
    }else{
        throw NetworkError.failed
    }
}

Task{
    do{
        
        let result = try await fetchData()
        print(result)
    }catch{
        print("Error fetching data: \(error)")
    }
}
