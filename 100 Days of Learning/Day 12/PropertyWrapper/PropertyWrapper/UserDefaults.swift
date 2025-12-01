//
//  UserDefaults.swift
//  PropertyWrapper
//
//  Created by Chanchal Raj on 30/11/2025.
//

import Foundation

@propertyWrapper
struct Userdefault <Value>{
    let key: String
    var wrappedValue: Value? {
        get {
            return UserDefaults.standard.value(forKey: key) as? Value
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: key)
        }
    }
}

extension UserDefaults {
    @Userdefault(key: "isUserAdmin")
    static var isUserAdmin: Bool?
}
