//
//  RocketListProtocols.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//

import Foundation

public protocol RocketListModuleInput {
    var moduleOutput: RocketListModuleOutput? { get }
}

public protocol RocketListModuleOutput: AnyObject {
}

protocol RocketListViewInput: AnyObject {
    func showData(data: [Rocket])
    func showAlert(title: String, message: String)
}

protocol RocketListViewOutput: AnyObject {
    func viewDidLoad()
    func didSelect(rocket: Rocket)
}

protocol RocketListInteractorInput: AnyObject {
    func requestData()
}

protocol RocketListInteractorOutput: AnyObject {
    func dataDidRecieved(data: [Rocket])
    func handleError(error: NetworkManagerError)
}

protocol RocketListRouterInput: AnyObject {
    func openRocketDetailsModule(for rocket: Rocket)
}

protocol RocketListRouterOutput: AnyObject {
}
