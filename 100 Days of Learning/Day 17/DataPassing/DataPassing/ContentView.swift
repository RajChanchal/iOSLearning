//
//  ContentView.swift
//  DataPassing
//
//  Created by Chanchal Raj on 05/12/2025.
//

import SwiftUI

struct ContentView: View {
    let person: Person
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: \(person.name)")
            Text("Age: \(person.age)")
        }
        .padding()
    }
}

#Preview {
    ContentView(person: .init(name: "Bulbul", age: 32))
}
