//
//  RocketDetailsRouter.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  
//

import UIKit

final class RocketDetailsRouter {
    weak var presenter: RocketDetailsRouterOutput?
    weak var viewController: UIViewController?
}

extension RocketDetailsRouter: RocketDetailsRouterInput {
}
