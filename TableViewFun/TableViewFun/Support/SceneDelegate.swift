//
//  SceneDelegate.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/6/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		let dataService: DataService = LocalDataService()
		let dataManager = DataManager(dataService: dataService)
		let accountsVC = AccountsVC(dataManager: dataManager)
		let navController = UINavigationController(rootViewController: accountsVC)
		
		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = navController
		window?.makeKeyAndVisible()
	}
}

