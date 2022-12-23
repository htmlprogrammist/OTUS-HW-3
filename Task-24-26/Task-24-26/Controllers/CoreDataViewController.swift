//
//  CoreDataViewController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class CoreDataViewController: SearchableViewController {
    
    // MARK: - Private Properties
    
    private var data = [CDTodo]()
    
    var coreDataManager: CoreDataManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Core Data"
    }
    
    override func fetchData() {
        guard let result = coreDataManager.fetchTodos() else { return }
        data = result
        tableView.reloadData()
    }
    
    override func findItem(by text: String) {
        guard let result = coreDataManager.fetchTodos(by: text) else { return }
        data = result
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            fatalError("Could not dequeue or cast cell to TableViewCell")
        }
        cell.configure(with: data[indexPath.row])
        return cell
    }
}
