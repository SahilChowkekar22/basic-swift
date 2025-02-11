import UIKit

/*  DispatchGroup in Swift (part of Grand Central Dispatch, GCD) allows multiple asynchronous tasks to be grouped together so that you can track when they all complete. This is useful when you need to:
 
 Wait for multiple background tasks to finish before continuing.
 Perform synchronization between multiple async operations. */




func prepareDish(named dishName: String, completion: @escaping () -> Void) {
    print("Preparing \(dishName)...")
    DispatchQueue.global().async {
        let preparationTime = Double.random(in: 2...5)
        Thread.sleep(forTimeInterval: preparationTime)
        print("\(dishName) is ready!")
        completion()
    }
}

// Create a DispatchGroup
let dispatchGroup = DispatchGroup()

// List of dishes to prepare
let dishesToPrepare = ["Pasta", "Salad", "Steak", "Soup", "Dessert"]

// Start preparing dishes
for dish in dishesToPrepare {
    // Enter the group before starting the task
    dispatchGroup.enter()
    
    prepareDish(named: dish) {
        // Leave the group when the dish is prepared
        dispatchGroup.leave()
    }
}

// Notify when all dishes are prepared
dispatchGroup.notify(queue: .main) {
    print("All dishes are ready! Serving the meal now.")
}


