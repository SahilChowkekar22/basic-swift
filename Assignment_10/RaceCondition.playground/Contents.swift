import UIKit

/* A race condition is a concurrency issue that occurs when multiple threads or tasks access and modify shared data simultaneously, leading to unpredictable behavior and inconsistent results.
 
 Why Do Race Conditions Happen?
 Race conditions occur when:
 - Multiple threads or tasks execute in parallel
 - They access and modify shared data at the same time
 - The final outcome depends on the unpredictable execution order.
 
 To fix race condition
 - Actor
 - Locks
 - Semaphores
 - Serial Queue */


var counter = 0  // Shared resource

func incrementCounter() {
    for _ in 1...1000 {
        counter += 1  // Simultaneous modification!
    }
}

Task {
    await withTaskGroup(of: Void.self) { group in
        for _ in 1...5 {
            group.addTask {
                incrementCounter()
            }
        }
    }
    print("Final Counter Value: \(counter)") // Output may vary!
}


