//
//  PetNameVC.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/10/23.
//

import UIKit


class PetNameVC: UIViewController {
	
	weak var coordinator: PetProfileCreationCoordinator?
	
	let nextButton = Button(title: "Next")
	
	init(coordinator: PetProfileCreationCoordinator) {
		self.coordinator = coordinator
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "Type your Pet Name"
		view.backgroundColor = .systemBackground
		configureCallToActionButton()
	}
	
	
	@objc private func nextButtonTapped() {
		print(#function)
		coordinator?.handlePetNameSelection("Elvis")
		
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
