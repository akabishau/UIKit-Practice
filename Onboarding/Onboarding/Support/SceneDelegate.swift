//
//  SceneDelegate.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/9/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var coordinator: MainAppCoordinator?
	

	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		// configure nav controller
		let navigationController = UINavigationController()
		coordinator = MainAppCoordinator(navigationController: navigationController)
		coordinator?.start()
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		let window = UIWindow(windowScene: windowScene)
		window.rootViewController = navigationController
		window.makeKeyAndVisible()
		self.window = window
	}
}

