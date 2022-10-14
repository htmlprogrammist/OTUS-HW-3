//
//  GameButton.swift
//  Task-16
//
//  Created by Егор Бадмаев on 13.10.2022.
//

import UIKit

enum GameButtonMode {
    case start, stop
}

final class GameButton: UIButton {
    
    // MARK: - Init
    
    init(mode: GameButtonMode) {
        super.init(frame: .zero)
        var configuration = UIButton.Configuration.filled()
        
        switch mode {
        case .start:
            configuration.title = "Старт"
            self.backgroundColor = .systemGreen
            self.tintColor = .systemGreen
        case .stop:
            configuration.title = "Стоп"
            self.backgroundColor = .systemRed
            self.tintColor = .systemRed
        }
        
        self.configuration = configuration
        self.layer.cornerRadius = 16
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
