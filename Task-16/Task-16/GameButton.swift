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
        
        switch mode {
        case .start:
            self.setTitle("Старт", for: .normal)
            self.backgroundColor = .systemGreen
        case .stop:
            self.setTitle("Стоп", for: .normal)
            self.backgroundColor = .systemRed
        }
        
        self.tintColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
