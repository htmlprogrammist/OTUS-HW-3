//
//  NetworkViewController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

enum Persistence {
    case coreData, userDefaults
}

final class NetworkViewController: ViewController {
    
    var coreDataManager: CoreDataManagerProtocol!
    
    // MARK: - Private Properties
    
    private let networkManager: NetworkManagerProtocol = NetworkManager(session: URLSession(configuration: .default))
    
    private var data = [Todo]()
    
    private lazy var cachingActionsMenu = UIMenu(title: "Меню", image: nil, identifier: nil, options: [], children: [
        UIAction(title: "Core Data", image: UIImage(systemName: "cylinder.split.1x2"), handler: { [unowned self] _ in
            save(in: .coreData)
        }),
        UIAction(title: "User Defaults", image: UIImage(systemName: "tray.full"), handler: { [unowned self] _ in
            save(in: .userDefaults)
        }),
        UIAction(title: "Clear CD", image: UIImage(systemName: "trash.slash"), handler: { [unowned self] _ in
            clear(in: .coreData)
        }),
        UIAction(title: "Clear UD", image: UIImage(systemName: "trash.slash"), handler: { [unowned self] _ in
            clear(in: .userDefaults)
        })
    ])
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Networking"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "externaldrive.badge.timemachine"), primaryAction: nil, menu: cachingActionsMenu)
    }
    
    override func fetchData() {
        let endpoint = Endpoint.random()
        let request = NetworkRequest(endpoint: endpoint)
        
        networkManager.perform(request: request) { [unowned self] (result: Result<[Todo], NetworkManagerError>) in
            switch result {
            case .success(let data):
                self.data = data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("❗️\(error.localizedDescription)")
            }
        }
    }
    
    private func save(in storage: Persistence) {
        switch storage {
        case .coreData:
            coreDataManager.loadTodos(data: data)
            break
        case .userDefaults:
            UserDefaults.cachedTodos = data
        }
        /// Для обновления таблицы на этих экранах.
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateTableViewNotification"), object: nil)
    }
    
    private func clear(in storage: Persistence) {
        switch storage {
        case .coreData:
            coreDataManager.clearAll()
            break
        case .userDefaults:
            UserDefaults.cachedTodos = []
        }
        /// Для обновления таблицы на этих экранах.
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateTableViewNotification"), object: nil)
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
