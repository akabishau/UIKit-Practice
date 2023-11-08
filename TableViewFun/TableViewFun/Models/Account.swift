//
//  Account.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/6/23.
//

import Foundation

struct Account: Codable {
	let name: String
	let balance: Double
	let transactions: [Transaction]
}

struct ApiResponse: Codable {
	let status: String
	let data: AccountsData
}

struct AccountsData: Codable {
	let accounts: [Account]
}
