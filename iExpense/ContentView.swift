//
//  ContentView.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/17.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ExpenseListView()
            .navigationTitle("iExpenses")
            .toolbar {
                NavigationLink() {
                    AddView()
                } label: {
                    Button("Add expense", systemImage: "plus") {  }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
