import UIKit

var greeting = "Hello, playground"


struct IntStack {
    private var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        items.removeLast()
    }
}

var myIntStack = IntStack()
myIntStack.push(5)
myIntStack.push(6)
myIntStack.push(8)
myIntStack.push(9)

print("Popping: \(myIntStack.pop())")
print("Popping: \(myIntStack.pop())")
print("Popping: \(myIntStack.pop())")
print("Popping: \(myIntStack.pop())")

struct GenericStack <Element>{
    private var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        items.removeLast()
    }
}

extension GenericStack {
    var topItem: Element? {
        items.last
    }
}

var myStringStack = GenericStack<String>()
myStringStack.push("Ali")
myStringStack.push("Wasan")
myStringStack.push("Khidmat")
myStringStack.push("Joggi")

print("Top: \(myStringStack.topItem)")
print("Popping: \(myStringStack.pop())")
print("Popping: \(myStringStack.pop())")
print("Popping: \(myStringStack.pop())")
print("Popping: \(myStringStack.pop())")
