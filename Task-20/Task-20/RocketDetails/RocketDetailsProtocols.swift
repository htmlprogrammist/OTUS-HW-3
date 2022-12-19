//
//  RocketDetailsProtocols.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  
//

import Foundation

public protocol RocketDetailsModuleInput {
    var moduleOutput: RocketDetailsModuleOutput? { get }
}

public protocol RocketDetailsModuleOutput: AnyObject {
}

protocol RocketDetailsViewInput: AnyObject {
    func showData(data: Rocket)
}

protocol RocketDetailsViewOutput: AnyObject {
    func viewDidLoad()
}

protocol RocketDetailsInteractorInput: AnyObject {
    func requestData()
}

protocol RocketDetailsInteractorOutput: AnyObject {
    func dataDidReceived(data: Rocket)
}

protocol RocketDetailsRouterInput: AnyObject {
}

protocol RocketDetailsRouterOutput: AnyObject {
}
