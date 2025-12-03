import UIKit

var greeting = "Hello, playground"

func addThem<T:Numeric>(number1: T, number2: T) -> T {
    return number1 + number2
}


let sum1 = addThem(number1: 5, number2: 4)

