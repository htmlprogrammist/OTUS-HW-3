//
//  OverviewView.swift
//  SpaceX
//
//  Created by Егор Бадмаев on 19.03.2022.
//

import UIKit

final class OverviewView: UIView {
    
    public var data: [Any] {
        didSet {
            displayData()
        }
    }
    
    private var titleText: String
    private let labels: [String]
    private let suffixes: [String]
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var titleLabel = UILabel(text: titleText, size: 24, weight: .bold)
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [], axis: .vertical, spacing: 15)
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    init(titleText: String, labels: [String], data: [Any], suffixes: [String]) {
        self.titleText = titleText
        self.labels = labels
        self.data = data
        self.suffixes = suffixes
        super.init(frame: .zero)
        
        setupViewAndConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewAndConstraints() {
        addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(mainStackView)
        
        displayData()
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func displayData() {
        for i in 0..<data.count {
            if let dataUnwrapped = data[i] as? String, dataUnwrapped != "nil", dataUnwrapped != "" {
                let label1 = UILabel(text: labels[i], weight: .bold)
                let label2 = UILabel(text: dataUnwrapped + suffixes[i], weight: .bold, color: .slateGray)
                label2.textAlignment = .left
                label1.widthAnchor.constraint(equalToConstant: 120).isActive = true
                
                let stackView = UIStackView(arrangedSubviews: [label1, label2], axis: .horizontal, spacing: 30)
                mainStackView.addArrangedSubview(stackView)
            }
        }
    }
}
