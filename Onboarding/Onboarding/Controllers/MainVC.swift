//
//  MainVC.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/9/23.
//

import UIKit

class MainVC: UIViewController {
	
	var mainCoordinator: MainAppCoordinator?
	
	let addPetButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Add Pet", for: .normal)
		button.backgroundColor = .systemPink
		button.layer.cornerRadius = 10
		button.setTitleColor(.white, for: .normal)
		button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		configureCallToActionButton()
	}
	
	
	@objc private func addPetButtonTapped() {
		print(#function)
		mainCoordinator?.addPetProfile()
	}
	
	
	private func configureCallToActionButton() {
		view.addSubview(addPetButton)
		addPetButton.addTarget(self, action: #selector(addPetButtonTapped), for: .touchUpInside)
		
		let padding: CGFloat = 50
		
		NSLayoutConstraint.activate([
			addPetButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
			addPetButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			addPetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
			addPetButton.heightAnchor.constraint(equalToConstant: padding)
		])
	}
}

