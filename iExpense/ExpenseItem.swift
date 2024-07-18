//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/18.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
