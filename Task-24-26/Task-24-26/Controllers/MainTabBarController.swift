//
//  MainTabBarController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private let coreDataManager: CoreDataManagerProtocol = CoreDataManager(containerName: "Task_24_26")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let viewController = NetworkViewController()
        viewController.coreDataManager = coreDataManager
        let networkViewController = createNavController(viewController: viewController, itemName: "Networking", itemImage: "network")
        let viewController2 = CoreDataViewController()
        viewController2.coreDataManager = coreDataManager
        let coreDataViewController = createNavController(viewController: viewController2, itemName: "Core Data", itemImage: "cylinder.split.1x2")
        let userDefaultsViewController = createNavController(viewController: UserDefaultsViewController(), itemName: "User Defaults", itemImage: "tray.full")
        
        viewControllers = [networkViewController, coreDataViewController, userDefaultsViewController]
    }
    
    func createNavController(viewController: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage), tag: 0)
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem = item
        return navController
    }
}
