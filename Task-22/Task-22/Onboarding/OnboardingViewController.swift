//
//  OnboardingViewController.swift
//  Task-22
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let viewModels = [
        OnboardingViewModel(title: "Планирование по-новому",
                            description: "Откройте для себя планирование на месяц как новый инструмент для достижения своих целей",
                            imageName: "lightbulb"),
        OnboardingViewModel(title: "Всё на виду",
                            description: "Легко отслеживайте свой прогресс в течение месяца с помощью простых графиков",
                            imageName: "chart.bar.doc.horizontal"),
        OnboardingViewModel(title: "Визуализация данных",
                            description: "Ознакомьтесь со своими данными и становитесь лучшей версией себя",
                            imageName: "chart.bar.xaxis")
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OnboardingTableViewCell.self, forCellReuseIdentifier: OnboardingTableViewCell.identifier)
        tableView.register(OnboardingTableViewHeader.self, forHeaderFooterViewReuseIdentifier: OnboardingTableViewHeader.identifier)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.accessibilityIdentifier = "onboardingTableView"
        return tableView
    }()
    
    private let backgroundButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "onboardingButtonView"
        return view
    }()
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.zPosition = 1
        button.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "onboardingButton"
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setConstraints()
    }
}

// MARK: - Private Methods

private extension OnboardingViewController {
    
    @objc func continueButtonTapped() {
        let viewController = ViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(backgroundButtonView)
        backgroundButtonView.addSubview(continueButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: backgroundButtonView.topAnchor),
            
            backgroundButtonView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundButtonView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundButtonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backgroundButtonView.heightAnchor.constraint(equalToConstant: 84),
            
            continueButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}

// MARK: - UITableViewDataSource
extension OnboardingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OnboardingTableViewCell.identifier, for: indexPath) as? OnboardingTableViewCell
        else { return OnboardingTableViewCell() }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: OnboardingTableViewHeader.identifier) as? OnboardingTableViewHeader
        else {
            fatalError("Could not create header for the table view in History in section \(section)")
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
