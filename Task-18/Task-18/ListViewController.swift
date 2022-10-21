//
//  ViewController.swift
//  Task-18
//
//  Created by Егор Бадмаев on 21.10.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let users = [User(name: "John", age: Int.random(in: 14...40)),
                         User(name: "Roge", age: Int.random(in: 14...40)),
                         User(name: "Kiri", age: Int.random(in: 14...40)),
                         User(name: "Melissa", age: Int.random(in: 14...40)),
                         User(name: "Lond", age: Int.random(in: 14...40)),
                         User(name: "William", age: Int.random(in: 14...40)),
                         User(name: "Coke", age: Int.random(in: 14...40)),
                         User(name: "Almina", age: Int.random(in: 14...40))]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupController()
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGroupedBackground
        title = "List"
    }
    
    private func setupView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else {
            fatalError("Could not inititalize cell in cellForRowAt method")
        }
        cell.configure(with: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let destination = DetailViewController()
        destination.user = users[indexPath.row]
        present(destination, animated: true)
    }
}
