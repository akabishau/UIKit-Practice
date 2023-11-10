//
//  PetProfileCreationCoordinator.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/10/23.
//

import UIKit

class PetProfileCreationCoordinator: Coordinator {
	
	var navigationController: UINavigationController
	var parentCoordinator: MainAppCoordinator?
	
	var petProfileService: PetProfileService
	
	init(navigationController: UINavigationController, petProfileService: PetProfileService) {
		self.navigationController = navigationController
		self.petProfileService = petProfileService
	}
	
	func start() {
		print(#function)
		showPetTypeVC()
	}
	
	
	func didFinishCreatingPetProfile() {
		do {
			let _ = try petProfileService.savePet()
			// Handle the saved pet
			parentCoordinator?.childDidFinish(self)
		} catch {
			// Handle any errors that occur during the save operation
		}
	}
	
	
	func handlePetTypeSelection(_ type: String) {
		print(#function, type)
		petProfileService.setType(type)
		showPetNameVC()
	}
	
	
	func handlePetNameSelection(_ name: String) {
		print(#function, name)
		petProfileService.setName(name)
		showSavePetInfoVC()
		
		
	}
	
	
	func handlePetSave() {
		print("saving the pet info")
		didFinishCreatingPetProfile()
	}
	
	private func showPetTypeVC() {
		let petTypeVC = PetTypeVC()
		petTypeVC.coordinator = self
		navigationController.pushViewController(petTypeVC, animated: true)
	}
	
	
	private func showPetNameVC() {
		let petNameVC = PetNameVC(coordinator: self)
//		petNameVC.coordinator = self
		navigationController.pushViewController(petNameVC, animated: true)
	}
	
	private func showSavePetInfoVC() {
		let savePetInfoVC = SavePetInfoVC(coordinator: self)
		navigationController.pushViewController(savePetInfoVC, animated: true)
	}
}
