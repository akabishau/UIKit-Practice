//
//  MainAppCoordinator.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/9/23.
//

import UIKit

protocol Coordinator: AnyObject {
	var navigationController: UINavigationController { get set }
	func start()
}


class MainAppCoordinator: Coordinator {
	
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []
	
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let mainVC = MainVC()
		mainVC.mainCoordinator = self
		navigationController.pushViewController(mainVC, animated: true)
	}
	
	func childDidFinish(_ child: Coordinator) {
		// Remove the child coordinator
//		if let index = childCoordinators.firstIndex(where: { $0 === child }) {
//			childCoordinators.remove(at: index)
//		}
		childCoordinators.removeAll(where: { $0 === child })
		navigationController.popToRootViewController(animated: false)
		// can also find the specific vc in navigation stack and pop there
		// or reset the nav stack
	}
	
	
	// activate pet profile creation flow once triggered
	func addPetProfile() {
		let petProfileService = PetProfileService()
		let petProfileCoordinator = PetProfileCreationCoordinator(navigationController: navigationController, petProfileService: petProfileService)
		petProfileCoordinator.parentCoordinator = self
		childCoordinators.append(petProfileCoordinator)
		petProfileCoordinator.start()
	}
}


