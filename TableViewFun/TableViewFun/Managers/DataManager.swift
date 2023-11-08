//
//  DataManager.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/7/23.
//

import Foundation

class DataManager {
	private let dataService: DataService
	
	init(dataService: DataService) {
		self.dataService = dataService
	}
	
	func fetchAccounts(completion: @escaping (Result<[Account], Error>) -> Void) {
		dataService.fetchAccounts(completion: completion)
	}
}

