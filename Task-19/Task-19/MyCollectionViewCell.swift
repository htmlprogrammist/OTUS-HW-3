//
//  MyCollectionViewCell.swift
//  Task-19
//
//  Created by Егор Бадмаев on 23.10.2022.
//

import UIKit

final class MyCollectionViewCell: UICollectionViewCell {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with flag: Flag) {
        imageView.image = flag.image
        mainLabel.text = flag.name
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            
            mainLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: contentView.layoutMargins.top),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            mainLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
        ])
    }
}
