//
//  Test.swift
//  LearningRethrows
//
//  Created by Chanchal Raj on 27/11/2025.
//

struct Test {
    func logOperation(_ block: () throws -> Void) rethrows {
        print("Starting operation")
        do {
            try block()
            print("Operation Successful")
        } catch {
            print("Operation failed")
            throw error
        }
    }
}
