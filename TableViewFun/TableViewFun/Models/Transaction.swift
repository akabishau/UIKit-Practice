//
//  Transaction.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/6/23.
//

import Foundation

struct Transaction: Codable {
	let title: String
	let type: TransactionType
	let amount: Double
	let date: Date
	let category: String
	
}


enum TransactionType: String, Codable {
	case expense
	case income
	case transfer
}
