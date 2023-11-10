//
//  PetProfileService.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/10/23.
//

import Foundation

// should this be the service for profile itself or just profile creation?
class PetProfileService {
	
	private var petBuilder = PetBuilder() // init right away
	
	func setType(_ type: String) {
		_ = petBuilder.setType(type)
	}
	
	func setName(_ name: String) {
		_ = petBuilder.setName(name)
	}
	
	
	func savePet() throws {
		let pet = try petBuilder.build() // This will only succeed if all properties are set
		// Persist the pet object using your chosen method (e.g., Core Data)
		print("we created pet: \(pet)")
		// Reset the builder after saving
		petBuilder = PetBuilder()
	}
}
