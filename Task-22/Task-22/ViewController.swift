//
//  ViewController.swift
//  Task-22
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    
    /// Custom loader.
    private let activityIndicator: CustomActivityIndicator = {
        let activityIndicator = CustomActivityIndicator()
        activityIndicator.duration = 3.2
        activityIndicator.lineWidth = 5.5
        activityIndicator.color = .systemGray4
        activityIndicator.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 36),
            activityIndicator.widthAnchor.constraint(equalToConstant: 36),
        ])
    }
}
