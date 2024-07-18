//
//  ExpenseListItem.swift
//  iExpense
//
//  Created by Ayrton Parkinson on 2024/07/18.
//

import SwiftUI

struct CheapPrice: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.green)
            .clipShape(.capsule)
            .foregroundStyle(.white)
    }
}

struct AveragePrice: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.yellow)
            .clipShape(.capsule)
            .foregroundStyle(.black)
    }
}

struct HighPrice: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.red)
            .clipShape(.capsule)
            .foregroundStyle(.white)
    }
}

extension View {
    func cheapStyle() -> some View {
        modifier(CheapPrice())
    }
    
    func averageStyle() -> some View {
        modifier(AveragePrice())
    }
    
    func highStyle() -> some View {
        modifier(HighPrice())
    }
}

struct ExpenseListItem: View {
    var item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            if item.amount < 10 {
                Text(item.amount, format: .currency(code: "USD"))
                    .cheapStyle()
            } else if item.amount < 100 {
                Text(item.amount, format: .currency(code: "USD"))
                    .averageStyle()
            } else {
                Text(item.amount, format: .currency(code: "USD"))
                    .highStyle()
            }
        }
    }
}

#Preview {
    ExpenseListItem(item: ExpenseItem(name: "Test", type: "Personal", amount: 10))
}
