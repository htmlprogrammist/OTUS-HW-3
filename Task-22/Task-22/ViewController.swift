//
//  ViewController.swift
//  Task-22
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let activityIndicator = CustomActivityIndicator()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(activityIndicator)
        activityIndicator.lineWidth = 5
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 36),
            activityIndicator.widthAnchor.constraint(equalToConstant: 36),
        ])
    }
}
