//
//  ExpenseListView.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/24.
//

import SwiftUI
import SwiftData

struct ExpenseListView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [ExpenseItem]
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                ExpenseListItem(item: item)
            }
            .onDelete(perform: removeItems)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
}

#Preview {
    ExpenseListView()
        .modelContainer(for: ExpenseItem.self)
}
