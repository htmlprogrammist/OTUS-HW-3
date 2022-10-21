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
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func configure() {
        
    }
    
    // MARK: - Private Methods
    
    private func setupView() {
        accessoryType = .checkmark
    }
}
