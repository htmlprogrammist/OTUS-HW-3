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
        view.addSubview(startButton)
        view.addSubview(stopButton)
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
