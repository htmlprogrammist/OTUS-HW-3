//
//  SceneDelegate.swift
//  Task-16
//
//  Created by Егор Бадмаев on 13.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private var firstStart = true
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        if !firstStart {
            if let viewController = window?.rootViewController as? ViewController,
               let _ = viewController.timer { // если таймер до выключения существовал, то
                viewController.startButtonTapped()
            }
        }
        firstStart = false
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        if let viewController = window?.rootViewController as? ViewController {
            viewController.stopButtonTapped()
        }
    }
}
