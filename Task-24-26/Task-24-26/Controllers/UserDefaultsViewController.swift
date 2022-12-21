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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User Defaults"
    }
    
    override func fetchData() {
        data = UserDefaults.cachedTodos
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
