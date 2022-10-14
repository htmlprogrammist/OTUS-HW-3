//
//  ViewController.swift
//  Task-16
//
//  Created by Егор Бадмаев on 13.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: .medium)
        label.text = "00:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var startButton: GameButton = {
        let button = GameButton(mode: .start)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stopButton: GameButton = {
        let button = GameButton(mode: .stop)
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startButton, stopButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: - Private Methods
    
    @objc private func startButtonTapped() {
        
    }
    
    @objc private func stopButtonTapped() {
        
    }
    
    private func setupView() {
        view.addSubview(timeLabel)
//        view.addSubview(startButton)
//        view.addSubview(stopButton)
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
//            timeLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            timeLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: view.frame.size.height * 0.1),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            buttonsStackView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: view.frame.size.height * 0.05)
            
//            startButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
//            startButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 40),
//            startButton.trailingAnchor.constraint(equalTo: stopButton.leadingAnchor, constant: view.layoutMargins.right / 2),
//
//            stopButton.leadingAnchor.constraint(equalTo: startButton.trailingAnchor, constant: view.layoutMargins.left / 2),
//            stopButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
//            stopButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 40),
        ])
    }
}
