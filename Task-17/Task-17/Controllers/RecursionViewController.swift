//
//  RecursionViewController.swift
//  Task-17
//
//  Created by Егор Бадмаев on 23.10.2022.
//

import UIKit

class RecursionViewController: UIViewController {
    
    private let furtherButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Go Further"
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(furtherButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let backButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Go Back"
        let button = UIButton(configuration: configuration)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [furtherButton, backButton])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        view.backgroundColor = [UIColor.systemGreen, UIColor.systemRed, UIColor.systemBlue, UIColor.systemPurple, UIColor.magenta].randomElement()!
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func furtherButtonTapped() {
        let viewController = RecursionViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad", String(describing: self))
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear", String(describing: self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear", String(describing: self))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear", String(describing: self))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear", String(describing: self))
    }
}
