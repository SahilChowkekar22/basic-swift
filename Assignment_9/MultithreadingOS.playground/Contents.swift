import UIKit

/* Grand Central Dispatch (GCD) is Apple's concurrency framework used to manage concurrent tasks efficiently in iOS, macOS, watchOS, and tvOS applications. It provides a simple and powerful way to execute tasks asynchronously or synchronously, utilizing system resources optimally. GCD leverages dispatch queues to handle operations in a thread-safe manner, improving performance without requiring manual thread management.*
 Types of GCD Queues
 GCD provides three main types of dispatch queues:
 - Main Queue (UI Queue)
 - Serial Queue
 - Concurrent Queue
 
 Types of Task Execution in GCD
 Synchronous (sync)
 - Blocks the current thread until the task finishes execution.
 Used when execution order matters.
 Example: dispatchSync(queue) { }
 
 Asynchronous (async)
- Does not block the current thread and executes tasks in the background.
 Allows smooth UI performance and better responsiveness.
 Example: dispatchAsync(queue) { }

*/

/* - Main Queue (UI Queue)
 A special serial queue that executes tasks on the main thread.
 Used for updating UI components.
 Example: Updating labels, buttons, or any UI elements.
 */

DispatchQueue.main.async {
    print("Start UI Animation")
}

/* Serial Queue
 Executes tasks one at a time in a FIFO (First-In, First-Out) order.
 Ensures synchronization and prevents race conditions.
 Example: Used for updating UI, managing shared resources, or handling critical sections. */

let userRequestQueue = DispatchQueue(label: "com.example.userRequestQueue")

func processUserRequest(_ id: Int) {
    userRequestQueue.async {
        print("Processing request \(id)...")
        sleep(2)
        print("Completed request \(id).")
    }
}
processUserRequest(1)
processUserRequest(2)
processUserRequest(3)

/*Concurrent Queue
 
 Executes multiple tasks in parallel while still maintaining FIFO order per task.
 GCD determines the number of threads based on system resources.
 Example: Used for performing multiple background operations, such as fetching multiple API responses simultaneously.
 */

let imageDownloadQueue = DispatchQueue(label: "com.example.imageDownloadQueue", attributes: .concurrent)

func downloadImage(_ name:String){
    imageDownloadQueue.async {
        print("Downloading image \(name)...")
        sleep(UInt32(Int.random(in: 1...3)))
        print("Downloaded image \(name).")
    }
}

downloadImage("Image1.png")
downloadImage("Image2.png")
downloadImage("Image3.png")


//sync and async.

let queue = DispatchQueue(label: "com.example.queue", attributes: .concurrent)

print("Main task started")

queue.sync {
    print("Sync Task 1 started")
    sleep(1)
    print("Sync Task 1 completed")
}

queue.async {
    print("Async Task 2 started")
    sleep(2)
    print("Async Task 2 completed")
}

queue.async {
    print("Async Task 3 started")
    sleep(1)
    print("Async Task 3 completed")
}

print("Main task completed")
