import UIKit

var greeting = "Hello, playground"
func swap(a: inout Int, b: inout  Int) {
    let temp = a
    a = b
    b = temp
}
var a = 10
var b = 15
swap(a: &a, b: &b)
print("Value of a: \(a), value of b: \(b)")


func swapGen<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

swapGen(a: &a, b: &b)
print("Value of a: \(a), value of b: \(b)")


