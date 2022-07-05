//
//  ExpenseItem.swift
//  Demo_SwiftUI_Expense
//
//  Created by Tak Liu on 2022-07-05.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int    
}
