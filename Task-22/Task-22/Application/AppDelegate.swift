//
//  AppDelegate.swift
//  Task-22
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = OnboardingViewController()
        window.tintColor = .systemRed
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}
