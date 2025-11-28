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
    private static func normalize(_ number: Int) -> Int {
        return min(12, number)
    }
    
    var wrappedValue: Int {
        set {
            number = Self.normalize(newValue)
        }
        get {
            return number
        }
    }
    
    init(wrappedValue: Int) {
        self.number = Self.normalize(wrappedValue)
    }
}

@propertyWrapper
struct Capitalized {
    private var value: String
    private static func normalize(_ s: String) -> String {
        return s.capitalized
    }
    var wrappedValue: String {
        set {
            value = Self.normalize(newValue)
        }
        
        get {
            return value
        }
    }
    
    init(wrappedValue: String) {
        self.value = Self.normalize(wrappedValue)
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





