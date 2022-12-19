//
//  RocketListRouter.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//

import UIKit

final class RocketListRouter {
    weak var presenter: RocketListRouterOutput?
    weak var viewController: UIViewController?
}

extension RocketListRouter: RocketListRouterInput {
}
