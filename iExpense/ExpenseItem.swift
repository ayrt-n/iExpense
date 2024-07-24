//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/18.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
