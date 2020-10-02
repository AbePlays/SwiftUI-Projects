//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Abhishek Rawat on 02/10/20.
//  Copyright © 2020 Abe10. All rights reserved.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
