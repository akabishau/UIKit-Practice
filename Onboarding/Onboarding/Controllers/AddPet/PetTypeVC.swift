//
//  PetTypeVC.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/9/23.
//

import UIKit

class PetTypeVC: UIViewController {
	
	weak var coordinator: PetProfileCreationCoordinator?
	
	let nextButton = Button(title: "Next")
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Select Pet Type"
		view.backgroundColor = .systemBackground
		configureCallToActionButton()
	}
	
	// userDidSelectType -> set type
	
	
	@objc private func nextButtonTapped() {
		print(#function)
		coordinator?.handlePetTypeSelection("dog")
	}
	
	
	private func configureCallToActionButton() {
		view.addSubview(nextButton)
		nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
		
		let padding: CGFloat = 50
		
		NSLayoutConstraint.activate([
			nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
			nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
			nextButton.heightAnchor.constraint(equalToConstant: padding)
		])
	}
}
