//
//  TableViewCell.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    private let todosImageView = UIImageView()
    
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
    
    private func setupView() {
        let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        labelsStackView.spacing = 4
        labelsStackView.axis = .vertical
        
        let mainStackView = UIStackView(arrangedSubviews: [todosImageView, labelsStackView])
        mainStackView.spacing = 4
        mainStackView.axis = .horizontal
        contentView.addSubview(mainStackView)
    }
}
