//
//  NetworkViewController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class NetworkViewController: ViewController {
    
    var networkManager: NetworkManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Networking"
    }
    
    override func fetchData() {
        
    }
}
