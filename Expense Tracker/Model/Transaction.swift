//
//  Transaction.swift
//  Expense Tracker
//
//  Created by Billy Okoth on 15/05/2024.
//

import SwiftUI

struct Transaction:Identifiable ,Equatable {
    let id:UUID = .init()
    //properties
    
    var title:String
    var remarks:String
    var amount:Double
    var dateAdded:Date
    var category:String
    var tintColor:String
    
    init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.amount = amount
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    
    //extracting color value from tintcolor string
    
    var color:Color {
        return tints.first(where: { $0.color == tintColor  })? .value ?? appTint
    }
}
///sample transactions
var sampleTransactions: [Transaction] = [
    .init(title: "Magic Keyboard", remarks: "Apple Product", amount: 129, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Apple Music ", remarks: "Subscription", amount: 10.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Icloud+ ", remarks: "Subscription", amount: 0.99, dateAdded: .now, category: .expense, tintColor: tints.randomElement()!),
    .init(title: "Payment ", remarks: "Payment Received!", amount: 2499, dateAdded: .now, category: .income, tintColor: tints.randomElement()!)
]
