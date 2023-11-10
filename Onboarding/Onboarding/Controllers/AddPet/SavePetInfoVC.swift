//
//  PetSaveProfileVC.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/10/23.
//

import UIKit


class SavePetInfoVC: UIViewController {
	
	weak var coordinator: PetProfileCreationCoordinator?
	
	let saveButton = Button(title: "Save")
	
	init(coordinator: PetProfileCreationCoordinator) {
		self.coordinator = coordinator
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		title = "You are done! Save Info now"
		view.backgroundColor = .systemBackground
		configureCallToActionButton()
	}
	
	
	@objc private func saveButtonTapped() {
		print(#function)
		coordinator?.handlePetSave()
		
	}
	
	private func configureCallToActionButton() {
		view.addSubview(saveButton)
		saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
		
		let padding: CGFloat = 50
		
		NSLayoutConstraint.activate([
			saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
			saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
			saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
			saveButton.heightAnchor.constraint(equalToConstant: padding)
		])
	}
}
