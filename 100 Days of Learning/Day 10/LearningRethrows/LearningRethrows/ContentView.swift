//
//  ContentView.swift
//  LearningRethrows
//
//  Created by Chanchal Raj on 27/11/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            generateBeauty()
            testIfEven(number: 2)
            testIfEven(number: 3)
        }
    }
    
    private func generateBeauty() {
        Test().logOperation {
            print("My operation")
        }
    }
    
    private func testIfEven(number: Int) {
        let test = Test()
        do {
            try test.logOperation {
                if number % 2 == 0{
                    print("My even: \(number)")
                } else {
                    print("It's an odd")
                    throw NSError(domain: "", code: 2)
                }
            }
        } catch {
            print("Error")
        }
    }
}

#Preview {
    ContentView()
}
