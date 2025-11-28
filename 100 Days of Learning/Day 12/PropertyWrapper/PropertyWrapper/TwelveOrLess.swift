//
//  TwelveOrLess.swift
//  PropertyWrapper
//
//  Created by Chanchal Raj on 28/11/2025.
//


import Foundation

@propertyWrapper
struct TwelveOrLess {
    private var number: Int = 0
    var wrappedValue: Int {
        return min(12, number)
    }
    init(wrappedValue: Int) {
        self.number = wrappedValue
    }
}

@propertyWrapper
struct Capitalized {
    private var value: String
    var wrappedValue: String {
        return value.capitalized
    }
    
    init(wrappedValue: String) {
        self.value = wrappedValue
    }
}


struct Child: CustomStringConvertible {
    var description: String {
        return "Name: \(name) Age: \(age)"
    }
    
    @TwelveOrLess var age: Int
    @Capitalized var name: String
}

class TestingPropertyWrapper {
    static func test() {
        let child1 = Child(age: 15, name: "manya")
        let child2 = Child(age: 2, name: "dikhsha")
        let child3 = Child(age: 5, name: "deEn")
        print(child1)
        print(child2)
        print(child3)
    }
}





