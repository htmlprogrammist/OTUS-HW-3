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
}

protocol RocketDetailsViewOutput: AnyObject {
}

protocol RocketDetailsInteractorInput: AnyObject {
}

protocol RocketDetailsInteractorOutput: AnyObject {
}

protocol RocketDetailsRouterInput: AnyObject {
}

protocol RocketDetailsRouterOutput: AnyObject {
}
