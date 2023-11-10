//
//  Pet.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/9/23.
//

import Foundation

struct Pet {
	var type: String
	var name: String
	var breed: String?
	var birthday: Date?
	var adoptionDate: Date?
	var gender: String?
}


class PetBuilder {
	var type: String?
	var name: String?
	var breed: String?
	var birthday: Date?
	var adoptionDate: Date?
	var gender: String?
	
	func setName(_ name: String) -> PetBuilder {
		self.name = name
		return self
	}
	
	
	func setType(_ type: String) -> PetBuilder {
		print(#function, type)
		self.type = type
		return self
	}
	
	
	func build() throws -> Pet {
		guard
			let type = type,
			let name = name
//			let breed = breed,
//			let birthday = birthday,
//			let adoptionDate = adoptionDate,
//			let gender = gender
		else {
			throw PetBuildError.missingRequiredFields
		}
//		return Pet(type: type, name: name, breed: breed, birthday: birthday, adoptionDate: adoptionDate, gender: gender)
		return Pet(type: type, name: name)
	}
}

enum PetBuildError: Error {
	case missingRequiredFields
}


