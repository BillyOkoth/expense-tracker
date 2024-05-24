//
//  TransactionCardView.swift
//  Expense Tracker
//
//  Created by Billy Okoth on 21/05/2024.
//

import SwiftUI

struct TransactionCardView: View {
    var transaction:Transaction
    
    var body: some View {
        HStack(spacing:12){
            Text("\(String(transaction.title.prefix(1)))")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 45, height: 45)
                .background(transaction.color.gradient ,in: .circle)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(transaction.title)
                    .foregroundStyle(Color.primary)
                Text(transaction.remarks)
                    .font(.caption)
                    .foregroundStyle(Color.primary.secondary)
                Text(format(transaction.dateAdded, format: "dd MMM yyyy"))
                    .font(.caption2)
                    .foregroundStyle(.gray)
            })
            .lineLimit(10)
            .hSpacing(.leading)
            
            Text(currencyString(transaction.amount ,allowedDigits: 2))
                .fontWeight(.semibold)
        }
        .padding([.horizontal , .vertical] ,15)
        .background(.background.opacity(1) , in: .rect)
        .cornerRadius(15)
    }
}

#Preview {
    TransactionCardView(transaction:sampleTransactions[0])
}
