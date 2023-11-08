//
//  DataError.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/7/23.
//

import Foundation

// can be thrown
enum DataError: Error {
	case fileNotFound
	case readError(Error) // associated value - instance of type Error
	case decodingError(Error)
}

// by also conforming to LocalizedError, you can provide a user-friendly error message.
extension DataError: LocalizedError {
	
	var errorDescription: String? {
		switch self {
			case .fileNotFound:
				// return "key" itself when .strings is not implemented
				return NSLocalizedString("The required file was not found in the app bundle", comment: "File Not Found")
			case .readError(let error):
				return error.localizedDescription
			case .decodingError(let error):
				return error.localizedDescription
		}
	}
}
