//
//  Expenses.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/18.
//

import Foundation
import SwiftData

@Model
class Expenses {
    var items: [ExpenseItem]
    
    init(items: [ExpenseItem] = [ExpenseItem]()) {
        self.items = items
    }
}
