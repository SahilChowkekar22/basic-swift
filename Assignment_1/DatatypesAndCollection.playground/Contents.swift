import UIKit
// var and let are variable and constant
// var is mutable and char is Immutable

var greeting = "Hello, playground"
print(greeting)

// Int
let age = 12
print(age)

let newAge: Int = 13 // Explict type declaration
print("age is \(newAge)")

var num = 10
print(num)

print()

// Float

var price = 9.94
print(pi)

//Double
var pi: Double = 3.14259
print(pi)

print()

//String
var name : String = "Swift"
print(name)

var name1 = "Sahil"
print("My name is", name1)

let str = """
Hi, my name is Sahil.
I am learning Swift programming.
"""

print(str)




print()

//Char
let letter: Character = "A"
print(letter)

print()

//Bool
var isSwiftGood: Bool = true
print(isSwiftGood)

print()

//Examples of var and let
let name2 = "Sahil"
var score = 100

print("Name:\(name2)")
print("Score:",score)

score = 200
print("Score:\(score)")

print()

// Array - store multiple value of same type

var numbers: [Int] = [1,2,3,4,5]
print(numbers)

numbers.append(6)
print(numbers)

numbers.insert(0, at: 0)
print(numbers)

numbers.remove(at: 1)
print(numbers)

var fruits = ["Apple", "Banana", "Orange"]
print(fruits.count)

fruits.append("Mango")
print(fruits)

fruits.removeAll()
print(fruits)

print()

//Set is a unordered Collection. it doesn't take duplicates
var fruits1: Set = ["Apple", "Banana", "Orange", "Apple"]
print(fruits1)

fruits1.insert("Grapes")
print(fruits1)

var num1: Set<Int> = [1,3,4,2,3,5,4,2,4]
print(num1)

print()

// Dictionary-  creating key:value pair
var person = ["name":"Sahil","city":"LA"]
print(person)

person["state"] = "CA"
print(person)

person.removeValue(forKey: "city")
print(person)

