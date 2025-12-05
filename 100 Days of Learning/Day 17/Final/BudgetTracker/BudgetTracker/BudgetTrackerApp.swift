//
//  BudgetTrackerApp.swift
//  BudgetTracker
//
//  Created by Chanchal Raj on 06/12/2025.
//

import SwiftUI

@main
struct BudgetTrackerApp: App {
    let entries = [Entry.init(id: UUID(), category: "Technology", isExpense: true, amount: 20.0),
                   Entry.init(id: UUID(), category: "Salary", isExpense: false, amount: 1000.0),
                   Entry.init(id: UUID(), category: "Grocery", isExpense: true, amount: 50.0)
                   
    ]
    var body: some Scene {
        WindowGroup {
            ContentView(entries: entries)
        }
    }
}
