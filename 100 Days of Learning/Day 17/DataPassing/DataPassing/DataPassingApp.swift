//
//  DataPassingApp.swift
//  DataPassing
//
//  Created by Chanchal Raj on 05/12/2025.
//

import SwiftUI

@main
struct DataPassingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(person: .init(name: "Chanchal", age: 34))
        }
    }
}
