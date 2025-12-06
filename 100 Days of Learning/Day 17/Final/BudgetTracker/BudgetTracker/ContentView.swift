//
//  ContentView.swift
//  BudgetTracker
//
//  Created by Chanchal Raj on 06/12/2025.
//

import SwiftUI

struct ContentView: View {
    let entries: [Entry]
    var body: some View {
        List {
            ForEach(entries) { entry in
                EntryRow(entry: entry)
            }
        }
    }
}

struct EntryRow: View {
    let entry: Entry
    var body: some View {
        HStack{
            Text(entry.category)
            Spacer()
            //Text("$\(entry.amount, specifier: "%.2f")")
            Text(entry.amount, format: .currency(code: "USD"))
                .foregroundStyle(entry.isExpense ? .red : .green)
        }
    }
}

#Preview {
    let entries = [Entry.init(id: UUID(), category: "Technology", isExpense: true, amount: 20.0),
                   Entry.init(id: UUID(), category: "Salary", isExpense: false, amount: 1000.0),
                   Entry.init(id: UUID(), category: "Grocery", isExpense: true, amount: 50.0)
                   
    ]
    ContentView(entries: entries)
}
