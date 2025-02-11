import UIKit

/* An OperationQueue is a high-level abstraction over Grand Central Dispatch (GCD) that allows you to manage and execute operations concurrently or serially. Unlike GCD, OperationQueue provides more control over task execution, dependencies, and cancellation.
 
 Key Features of OperationQueue
 Can run tasks concurrently or serially.
 Supports dependencies (one task waits for another to finish).
 Supports cancellation of operations.
 Allows setting the maximum number of concurrent operations.
*/

class FileManagementSystem {
    
    func downloadFile(named filename: String){
        print("Downloading file: \(filename)...")
        Thread.sleep(forTimeInterval: 1.0)
        print("Download completed:\(filename)")
        
    }
    
    func processFile(named filename: String){
        print("Processing file: \(filename)...")
        Thread.sleep(forTimeInterval: 1.0)
        print("Processing completed:\(filename)")
        
    }
    
    func cleanUpTemporaryFiles(){
        print("Cleaning up temporary..")
        Thread.sleep(forTimeInterval: 1.0)
        print("Cleanup complete!")
        
    }
}

let operationQueue = OperationQueue()

operationQueue.maxConcurrentOperationCount = 3

let fileManager = FileManagementSystem()

let downloadFile1Operation = BlockOperation {
    fileManager.downloadFile(named: "File1.zip")
}

let downloadFile2Operation = BlockOperation {
    fileManager.downloadFile(named: "File2.zip")
}

let downloadFile3Operation = BlockOperation {
    fileManager.downloadFile(named: "File3.zip")
}

let processFile1Operation = BlockOperation {
    fileManager.processFile(named: "File1.zip")
}

let processFile2Operation = BlockOperation {
    fileManager.processFile(named: "File2.zip")
}

let processFile3Operation = BlockOperation {
    fileManager.processFile(named: "File3.zip")
}

let cleanUpOperation = BlockOperation {
    fileManager.cleanUpTemporaryFiles()
}

// Processing can only start after the corresponding file is downloaded
processFile1Operation.addDependency(downloadFile1Operation)
processFile2Operation.addDependency(downloadFile2Operation)
processFile3Operation.addDependency(downloadFile3Operation)

// Cleanup can only start after all files are processed
cleanUpOperation.addDependency(processFile1Operation)
cleanUpOperation.addDependency(processFile2Operation)
cleanUpOperation.addDependency(processFile3Operation)

// priorities
downloadFile1Operation.queuePriority = .high
downloadFile2Operation.queuePriority = .normal
downloadFile3Operation.queuePriority = .low

processFile1Operation.queuePriority = .high
processFile2Operation.queuePriority = .normal
processFile3Operation.queuePriority = .low

cleanUpOperation.queuePriority = .veryLow

// Add all operations to the queue
operationQueue.addOperations([
    downloadFile1Operation,
    downloadFile2Operation,
    downloadFile3Operation,
    processFile1Operation,
    processFile2Operation,
    processFile3Operation,
    cleanUpOperation
], waitUntilFinished: false)

