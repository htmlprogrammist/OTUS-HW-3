//
//  ViewController.swift
//  Task-16
//
//  Created by Егор Бадмаев on 13.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var timer: Timer?
    private var elapsedTime: TimeInterval = 0
    
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
        setupTimer()
    }
    
    // MARK: - Public Methods
    
    @objc public func stopButtonTapped() {
        timer?.invalidate()
        timer = nil
        
        startButton.isEnabled = true
        stopButton.isEnabled = false
    }
    
    @objc public func startButtonTapped() {
        if timer == nil {
            setupTimer()
        }
        if let timer = timer {
            RunLoop.current.add(timer, forMode: .common)
        }
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        view.addSubview(timeLabel)
        view.addSubview(buttonsStackView)
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: view.frame.size.height * 0.1),
            
            buttonsStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            buttonsStackView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: view.frame.size.height * 0.075)
        ])
    }
    
    private func setupTimer() {
        guard timer == nil else { return }
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        elapsedTime += 1
        var labelTimes = timeLabel.text?.components(separatedBy: ":") ?? ["00", "00"]
        labelTimes = [addZeroIfNeeded(to: Int(elapsedTime) / 60), addZeroIfNeeded(to: Int(elapsedTime) % 60)]
        timeLabel.text = labelTimes.joined(separator: ":")
    }
    
    private func addZeroIfNeeded(to number: Int) -> String {
        if number < 10 {
            return "0\(number)"
        }
        return String(number)
    }
}
