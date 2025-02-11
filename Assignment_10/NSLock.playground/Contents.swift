import UIKit

/* NSLock is a synchronization mechanism in Swift that ensures only one thread can access a shared resource at a time, preventing race conditions. It works by locking a resource before access and unlocking it after the task is complete, allowing other threads to access the resource sequentially.
 
*/

import UIKit
import Foundation

var counter = 0
let lock = NSLock()

// Increment counter with NSLock to ensure thread safety
@MainActor func incrementCounter() {
    for _ in 1...1000 {
        lock.lock()  // Acquire the lock
        counter += 1  // Modify the shared resource
        lock.unlock()  // Release the lock
    }
}

// Asynchronous task group to increment counter
Task {
    await withTaskGroup(of: Void.self) { group in
        for _ in 1...5 {
            group.addTask {
                await incrementCounter()  // Run increment concurrently
            }
        }
    }

    // Ensure that we print the final value after all tasks are done
    print("Final Counter Value: \(counter)")  // Output: consistent value
}
