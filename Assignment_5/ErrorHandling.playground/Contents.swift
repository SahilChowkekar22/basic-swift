import UIKit

/* Error Handling - Swift provides a robust error-handling mechanism to gracefully handle and recover from errors during program execution. It uses the Error protocol, do-catch statements, throws, and try keywords to handle errors safely.
 
*/

// 1. do try catch
enum AgeError: Error {
    case invalidAge
}

func registerUser(age: Int) throws{
    if age < 18{
        throw AgeError.invalidAge
    }
    print("User registered successfully")
}

do{
    try registerUser(age: 17)
}catch AgeError.invalidAge{
    print("Error: You must be a least 18 years old to register")
}


/* 2.try? (Optional Try)
    - Converts the thrown error into nil instead of propagating it.
    - If the function succeeds, it returns an optional value.
    - If it fails, it returns nil without crashing.*/

let result: ()? = try? registerUser(age: 14)
if result == nil {
    print("Registration Failed. Age requirement not met.")
}
 
 
/* 3.try! (Force Try)
 - Assumes that the function will not fail and disables error handling.
 - If an error occurs, the program crashes.
 - Use it only when you're 100% sure the function won't throw an error.*/

let result1: () = try! registerUser(age: 14)


