import UIKit

/* A TaskGroup is a structured way to create multiple child tasks within a parent task, ensuring proper lifecycle management and resource efficiency.
 
 - Runs multiple tasks concurrently
 - Automatically manages task execution
 - Ensures all tasks complete before proceeding

*/

func fetchUser(id: Int) async ->String {
    return "User \(id) data fetched"
}

func fetchAllusers() async{
    await withTaskGroup(of: String.self){ group in
        for id in 1...5{
            group.addTask {
                await fetchUser(id: id)
            }
        }
        
        for await user in group{
            print(user)
        }
        
    }
}

Task{
    await fetchAllusers()
}
