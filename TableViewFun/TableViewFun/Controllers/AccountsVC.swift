//
//  ViewController.swift
//  TableViewFun
//
//  Created by Aleksey Kabishau on 11/6/23.
//

import UIKit

class AccountsVC: UIViewController {
	
	private var dataManager: DataManager
	private let tableView = UITableView()
	private var accounts: [Account] = []
	
	init(dataManager: DataManager) {
		self.dataManager = dataManager
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		title = "Accounts"
		
		configureTableView()
		fetchData()
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
	
	
	private func fetchData() {
		dataManager.fetchAccounts(completion: { [weak self] result in
			guard let self = self else { return }
			switch result {
				case .success(let accounts):
					// update UI
					print("accounts: ", accounts.count)
					self.accounts = accounts
					self.tableView.reloadData()
				case .failure(let error):
					
					print(error.localizedDescription)
					// present Alert
			}
		})
	}
}


extension AccountsVC: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return accounts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let account = accounts[indexPath.row]
		cell.textLabel?.text = account.name
		// Here you can customize the cell further
		return cell
	}
}


extension AccountsVC: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Selected account: \(accounts[indexPath.row].name)")
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
