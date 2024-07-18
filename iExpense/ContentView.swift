//
//  ContentView.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/17.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                if !expenses.personalExpenses.isEmpty {
                    Section("Personal Expenses") {
                        ForEach(expenses.items.filter { $0.type == "Personal" }) { item in
                            ExpenseListItem(item: item)
                        }
                        .onDelete(perform: removeItems)
                    }
                }
                
                if !expenses.businessExpenses.isEmpty {
                    Section("Business Expenses") {
                        ForEach(expenses.items.filter { $0.type == "Business" }) { item in
                            ExpenseListItem(item: item)
                        }
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
        }
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
