//
//  TableViewCell.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    private let todosImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .secondaryLabel
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with data: Todo) {
        if data.completed {
            todosImageView.tintColor = .systemGreen
            todosImageView.image = UIImage(systemName: "checkmark.circle")
        } else {
            todosImageView.tintColor = .systemRed
            todosImageView.image = UIImage(systemName: "circle")
        }
        titleLabel.text = data.title
        subtitleLabel.text = "ID: \(data.id), user ID: \(data.userID)"
    }
    
    public func configure(with data: CDTodo) {
        if data.completed {
            todosImageView.tintColor = .systemGreen
            todosImageView.image = UIImage(systemName: "checkmark.circle")
        } else {
            todosImageView.tintColor = .systemRed
            todosImageView.image = UIImage(systemName: "circle")
        }
        titleLabel.text = data.title
        subtitleLabel.text = "ID: \(data.id), user ID: \(data.userID)"
    }
    
    private func setupView() {
        let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        labelsStackView.spacing = 4
        labelsStackView.axis = .vertical
        
        contentView.addSubview(labelsStackView)
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(todosImageView)
        
        NSLayoutConstraint.activate([
            todosImageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            todosImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            todosImageView.heightAnchor.constraint(equalToConstant: 28),
            todosImageView.widthAnchor.constraint(equalToConstant: 28),
            
            labelsStackView.leadingAnchor.constraint(equalTo: todosImageView.trailingAnchor, constant: 8),
            labelsStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            labelsStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
}
