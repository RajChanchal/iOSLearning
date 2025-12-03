import UIKit

var greeting = "Hello, playground"

func addThem<T:Numeric>(number1: T, number2: T) -> T {
    return number1 + number2
}


let sum1 = addThem(number1: 5, number2: 4)


// ========
func findFirstIndex(string: String, from arr: [String]) -> Int? {
    for (index, item) in arr.enumerated() {
        if item == string {
            return index
        }
    }
    return nil
}

let myArray = ["Ali", "Asghar", "Khoso"]
let index = findFirstIndex(string: "Khoso", from: myArray)
if let index {
    print("Found at \(index)")
}


func findFirstIndexGeneric<T: Equatable>(value: T, from array: [T]) -> Int? {
    for (index, item) in array.enumerated() {
        if item == value {
            return index
        }
    }
    return nil
}

let myIntArray = [5,4,3,2,2]
let index2 = findFirstIndexGeneric(value: 3, from: myIntArray)
print("Found at: \(index2)")
