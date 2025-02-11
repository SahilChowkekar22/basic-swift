import UIKit

/* 1)Actor -  An Actor in Swift is a type that protects its data by ensuring that only one thread or task can access its mutable state at a time. This is a powerful concurrency feature introduced in Swift 5.5 that helps to prevent race conditions and data corruption by enforcing synchronized access to the actor's properties and methods. */


actor Counter {
    private var count = 0
    
    func increment() {
        count += 1
    }
    
    func currentValue()-> Int {
        return count
    }
}

func incrementCounter() async {
    let counter = Counter()
    
    async let task1 = counter.increment()
    async let task2 = counter.increment()
    async let task3 = counter.increment()
    
    await task1
    await task2
    await task3
    
    let finalValue = await counter.currentValue()
    print("Final Counter Value: \(finalValue)")
    
}

Task{
    await incrementCounter()
}
