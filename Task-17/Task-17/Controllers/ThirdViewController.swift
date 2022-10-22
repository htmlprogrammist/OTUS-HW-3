//
//  ThirdViewController.swift
//  Task-17
//
//  Created by Егор Бадмаев on 15.10.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var furtherButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
        print("viewDidLoad", String(describing: self))
    }
    
    @IBAction func furtherButtonTapped(_ sender: Any) {
        let vc = RecursionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("viewWillAppear", String(describing: self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("viewDidAppear", String(describing: self))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("viewWillDisappear", String(describing: self))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("viewDidDisappear", String(describing: self))
    }
}
