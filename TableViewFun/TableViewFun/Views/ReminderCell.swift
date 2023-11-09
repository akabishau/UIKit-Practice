//
//  ReminderCell.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/9/23.
//

import UIKit

class ReminderCell: UITableViewCell {
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 18, weight: .bold)
		return label
	}()
	
	let dateLabel: UILabel = {
		let label = UILabel()
		label.font = .systemFont(ofSize: 14, weight: .regular)
		label.textColor = .systemGray
		return label
	}()
	
	let isCompleteIndicator: UIImageView = {
		let view = UIImageView()
		view.contentMode = .scaleAspectFit
		view.image = UIImage(systemName: "circle")
		return view
	}()
	
	static let reuseId = String(describing: ReminderCell.self)
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		layout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func set(with reminder: Reminder) {
		titleLabel.text = reminder.title
		dateLabel.text = formatDate(reminder.dueDate)
		isCompleteIndicator.image = UIImage(systemName: reminder.isComplete ? "checkmark.circle.fill" : "circle")
	}
	
	
	private func layout() {
		
		[titleLabel, dateLabel, isCompleteIndicator].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview($0)
		}
		
		let paddding: CGFloat = 20
		
		NSLayoutConstraint.activate([
			isCompleteIndicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: paddding),
			isCompleteIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			isCompleteIndicator.widthAnchor.constraint(equalToConstant: 20),
			isCompleteIndicator.heightAnchor.constraint(equalToConstant: 20),
			
			titleLabel.leadingAnchor.constraint(equalTo: isCompleteIndicator.trailingAnchor, constant: paddding),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -paddding),
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
			
			dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
			dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
			dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
			dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
		])
	}
	
	private func formatDate(_ date: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .short
		return dateFormatter.string(from: date)
	}
}
