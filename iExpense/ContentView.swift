//
//  ContentView.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/17.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var sortOrder = [SortDescriptor(\ExpenseItem.name), SortDescriptor(\ExpenseItem.amount, order: .reverse)]
    @State private var filter = ["Personal", "Business"]
    
    var body: some View {
        NavigationStack {
            ExpenseListView(expenseTypes: filter, sortOrder: sortOrder)
            .navigationTitle("iExpenses")
            .toolbar {
                ToolbarItem {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name")
                                .tag([SortDescriptor(\ExpenseItem.name), SortDescriptor(\ExpenseItem.amount, order: .reverse)])
                            
                            Text("Sort by amount")
                                .tag([SortDescriptor(\ExpenseItem.amount, order: .reverse), SortDescriptor(\ExpenseItem.name)])
                        }
                    }
                }
                
                ToolbarItem {
                    Menu("Filter", systemImage: "slider.horizontal.3") {
                        Picker("Filter", selection: $filter) {
                            Text("Show all expenses")
                                .tag(["Personal", "Business"])
                            
                            Text("Show personal expenses")
                                .tag(["Personal"])
                            
                            Text("Show business expenses")
                                .tag(["Business"])
                        }
                    }
                }
                
                ToolbarItem {
                    NavigationLink() {
                        AddView()
                    } label: {
                        Button("Add expense", systemImage: "plus") {  }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
