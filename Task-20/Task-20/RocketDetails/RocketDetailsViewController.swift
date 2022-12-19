//
//  RocketDetailsViewController.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  
//

import UIKit

final class RocketDetailsViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let presenter: RocketDetailsViewOutput
    
    // MARK: - Init
    
    init(presenter: RocketDetailsViewOutput) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension RocketDetailsViewController: RocketDetailsViewInput {
}
