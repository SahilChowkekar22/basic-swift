import UIKit

/* a higher-order function is a function that takes another function as an argument or returns a function as its result. These functions allow for more flexible and reusable code*/


//map - The map function applies a transformation to each element of a collection and returns a new collection with transformed values.

let num = [1,2,3,4]
let StringNum = num.map{String($0)}
print(StringNum)

print()

let numbers = [1,2,3,4,5]
let DoubleNumbers = numbers.map{$0*2}
print(DoubleNumbers)

print()


// filter - The filter function returns a new collection containing elements that satisfy a given condition.

let names = ["Alice", "Bob", "Charlie", "Anna"]
let nameStartedWithA = names.filter{$0.hasPrefix("A")}
print(nameStartedWithA)

print()

let words = ["Swift", "Programing", "Code", "Development", "iOS"]
let longWords = words.filter{$0.count > 5}
print(longWords)

print()


// Sorted -The sorted() function in Swift is used to return a new array with the elements arranged in ascending or descending order. It does not modify the original array but instead returns a sorted version of it.

let name = ["Charlie", "Alice", "Bob", "David"]
let sortedNames = name.sorted()
print(sortedNames)

print()

let num1 = [4,34,5,6,1,46,2]
let sortedNumsDescending = num1.sorted(by: >)
print(sortedNumsDescending)
print()


// reduce - The reduce function combines all elements of a collection into a single value using a specified closure.
let num2 = [1,2,3,4,5]
let numMultiple = num2.reduce(1,*)
print(numMultiple)

print()


// faltMap - The flatMap function flattens a collection of collections into a single collection
let nestedArray = [[1, 2, 3], [4, 5], [6, 7, 8]]
let flatArray = nestedArray.flatMap { $0 }
print(flatArray)

// compactMap - The compactMap function removes nil values and unwraps optional elements in a collection.
let numbers1: [Int?] = [1, nil, 3, nil, 5]
let nonNilNumbers = numbers1.compactMap { $0 }
print(nonNilNumbers)

print()

let stringNumbers = ["1", "2", "abc", "4", "5"]
let validNumbers = stringNumbers.compactMap { Int($0) }
print(validNumbers)

print()

// forEach -T he forEach function in Swift is used to iterate over a collection (like an array, dictionary, etc.) and perform an action on each element. It is similar to a for-in loop, but it has a more functional style and does not return a value.

let userAge = ["Alice": 25, "Bob": 30, "Charlie": 22]
userAge.forEach { (key, value) in
    print("\(key) is \(value) years old.")
}

