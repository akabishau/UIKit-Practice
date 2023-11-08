//
//  DataService.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/7/23.
//

import Foundation

protocol DataService {
	func fetchAccounts(completion: @escaping (Result<[Account], Error>) -> Void)
}

class LocalDataService: DataService {
	
	func fetchAccounts(completion: @escaping (Result<[Account], Error>) -> Void) {
		
		// background in general but with pretty high priority
		// since json files can be big
		DispatchQueue.global(qos: .userInitiated).async {
			do {
				guard let url = Bundle.main.url(forResource: "accounts", withExtension: "json") else {
					throw DataError.fileNotFound
				}
				
				let data = try Data(contentsOf: url)
				
				let decoder = JSONDecoder()
				decoder.dateDecodingStrategy = .iso8601
				
				// decoding error
				let response = try decoder.decode(ApiResponse.self, from: data)
				let accounts = response.data.accounts
				
				DispatchQueue.main.async {
					completion(.success(accounts))
				}
				
				
//			} catch {
//				DispatchQueue.main.async {
//					completion(.failure(error))
//				}
			} catch let DecodingError.dataCorrupted(context) {
    print(context)
} catch let DecodingError.keyNotFound(key, context) {
    print("Key '\(key)' not found:", context.debugDescription)
    print("codingPath:", context.codingPath)
} catch let DecodingError.valueNotFound(value, context) {
    print("Value '\(value)' not found:", context.debugDescription)
    print("codingPath:", context.codingPath)
} catch let DecodingError.typeMismatch(type, context)  {
    print("Type '\(type)' mismatch:", context.debugDescription)
    print("codingPath:", context.codingPath)
} catch {
    print("error: ", error)
}
		}
	}
}


class RemoteDataService: DataService {
	
	func fetchAccounts(completion: @escaping (Result<[Account], Error>) -> Void) {
		// fetch and decode remote acocunt data
	}
}
