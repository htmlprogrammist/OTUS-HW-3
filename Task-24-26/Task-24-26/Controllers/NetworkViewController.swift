//
//  NetworkViewController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class NetworkViewController: ViewController {
    
    // MARK: - Private Properties
    
    private let networkManager: NetworkManagerProtocol = NetworkManager(session: URLSession(configuration: .default))
    
    private var data = [Todo]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Networking"
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
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            fatalError("Could not dequeue or cast cell to TableViewCell")
        }
        cell.configure(with: data[indexPath.row])
        return cell
    }
}
