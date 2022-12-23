//
//  UserDefaultsViewController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class UserDefaultsViewController: SearchableViewController {
    
    // MARK: - Private Properties
    
    private var data = [Todo]()
    private var filteredData = [Todo]()
    
    var isFiltering: Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Defaults"
    }
    
    override func fetchData() {
        data = UserDefaults.cachedTodos
        tableView.reloadData()
    }
    
    override func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredData = data.filter { (data: Todo) -> Bool in
            return data.title.contains(searchText.lowercased())
        }
        
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
        let todo: Todo
        
        if isFiltering {
            todo = data[indexPath.row]
        } else {
            todo = data[indexPath.row]
        }
        cell.configure(with: todo)
        return cell
    }
}
