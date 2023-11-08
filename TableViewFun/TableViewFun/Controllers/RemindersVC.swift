//
//  ViewController.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/6/23.
//

import UIKit

class RemindersVC: UIViewController {
	
	private let tableView = UITableView()
	private var reminders: [Reminder] = []
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		title = "Reminders"
		
		
		reminders = Reminder.sampleData
		configureTableView()
	}
	
	private func configureTableView() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
		
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.dataSource = self
		tableView.delegate = self
	}
}


extension RemindersVC: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return reminders.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let reminder = reminders[indexPath.row]
		cell.textLabel?.text = reminder.title
		return cell
	}
}


extension RemindersVC: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Selected account: \(reminders[indexPath.row].title)")
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
