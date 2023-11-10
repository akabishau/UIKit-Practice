//
//  MainCoordinator.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/9/23.
//

import UIKit

protocol Coordinator {
	var navigationController: UINavigationController { get set }
	func start()
}

class MainAppCoordinator: Coordinator {
	
	var navigationController: UINavigationController
	
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let viewController = MainVC()
		navigationController.pushViewController(viewController, animated: false)
	}
	
}
