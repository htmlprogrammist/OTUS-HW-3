//
//  MainTabBarController.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let networkViewController = createNavController(viewController: NetworkViewController(), itemName: "Networking", itemImage: "network")
        let coreDataViewController = createNavController(viewController: CoreDataViewController(), itemName: "Core Data", itemImage: "cylinder.split.1x2")
        let userDefaultsViewController = createNavController(viewController: UserDefaultsViewController(), itemName: "User Defaults", itemImage: "rectangle.stack.person.crop")
        
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
