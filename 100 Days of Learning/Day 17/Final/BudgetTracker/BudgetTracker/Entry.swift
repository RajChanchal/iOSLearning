//
//  Entry.swift
//  BudgetTracker
//
//  Created by Chanchal Raj on 06/12/2025.
//

import Foundation

struct Entry: Identifiable{
    let id: UUID
    let category: String
    let isExpense: Bool
    let amount: Double
}
