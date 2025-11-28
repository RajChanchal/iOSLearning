//
//  TwelveOrLess.swift
//  PropertyWrapper
//
//  Created by Chanchal Raj on 28/11/2025.
//


import Foundation

@propertyWrapper
struct TwelveOrLess {    
    var wrappedValue: Int {
        didSet {
            wrappedValue = min(12, wrappedValue)
        }
    }
    
    init(wrappedValue: Int) {
        self.wrappedValue = min(12, wrappedValue)
    }
}

@propertyWrapper
struct Capitalized {
    var wrappedValue: String {
        didSet{
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
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





