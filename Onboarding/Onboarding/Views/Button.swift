//
//  Button.swift
//  Onboarding
//
//  Created by Aleksey Kabishau on 11/10/23.
//

import UIKit

class Button: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(title: String, backgroundColor: UIColor = .systemBlue) {
		self.init(frame: .zero)
		self.backgroundColor = backgroundColor
		self.setTitle(title, for: .normal)
	}
	
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		layer.cornerRadius = 10
		setTitleColor(.white, for: .normal)
		titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
	}
}
