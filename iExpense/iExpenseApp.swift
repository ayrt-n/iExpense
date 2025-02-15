//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/17.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
