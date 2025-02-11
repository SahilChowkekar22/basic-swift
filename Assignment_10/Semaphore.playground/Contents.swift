import UIKit

/*A Semaphore is a synchronization object that controls access to a shared resource by multiple threads in a concurrent system. It works by maintaining a count (or signal) that tracks how many threads are allowed to access the resource at a time.*/

let semaphore = DispatchSemaphore(value: 1)

func accessSharedResource(threadId: Int) {
    print("Thread \(threadId) is waiting to access the shared resources.")
    
    semaphore.wait()
    
    print("Thread \(threadId) is accessing the shared resources.")
    sleep(2)
    
    semaphore.signal()
    
    print("Thread \(threadId) has finished accessing the shared resources.")
}

for i in 1...5{
    DispatchQueue.global().async {
        accessSharedResource(threadId: i)
    }
}

DispatchQueue.main.asyncAfter(deadline: .now() + 10){
    print("All threads have completed")
}
