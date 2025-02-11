import UIKit

/* A Dispatch Barrier is a synchronization mechanism in Swift used with dispatch queues to control access to a shared resource. It allows you to insert a barrier block in a concurrent queue. When a barrier block is added, it ensures that:
 
 - All tasks that are scheduled before the barrier are completed before the barrier block executes.
 - The barrier block itself will not execute until no other tasks are running in the queue.
 - No tasks will be executed after the barrier block until it has finished its work.*/

var sharedArray: [String] = []

let queue = DispatchQueue(label: "com.example.sharedArrayQueue", attributes: .concurrent)

func readArray(){
    queue .async {
        print("Reading from array: \(sharedArray)")
    }
}

func writeArray(item: String){
    queue .async(flags: .barrier) {
        sharedArray.append(item)
        print("Added \(item) to the Array")
    }
}

readArray()
writeArray(item: "Item 1")
readArray()
writeArray(item: "Item 2")
readArray()
writeArray(item: "Item 3")

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    print("Final Array: \(sharedArray)")
}
