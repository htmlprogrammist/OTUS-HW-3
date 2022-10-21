//
//  MyTableViewCell.swift
//  Task-18
//
//  Created by Егор Бадмаев on 21.10.2022.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    
    // MARK: - Public Properties
    
    static let identifier = "MyTableViewCell"
    
    // MARK: - Private Properties
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func configure(with user: User) {
        mainLabel.text = user.name
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            mainLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            mainLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
