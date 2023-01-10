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
    private var filteredData = [CDTodo]()
    
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
        filterContentForSearchText(text)
    }
    
    override func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text?.lowercased(), !text.isEmpty {
            filterContentForSearchText(text)
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
        guard let result = coreDataManager.fetchTodos(by: searchText) else { return }
        filteredData = result
        tableView.reloadData()
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredData.count
        }
        
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            fatalError("Could not dequeue or cast cell to TableViewCell")
        }
        let todo: CDTodo!
        
        if isFiltering {
            todo = filteredData[indexPath.row]
        } else {
            todo = data[indexPath.row]
        }
        
        cell.configure(with: todo)
        return cell
    }
}
