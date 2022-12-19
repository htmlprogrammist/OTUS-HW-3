//
//  RocketListAssembly.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//

import UIKit

public final class RocketListAssembly {
    
    // MARK: - Public Properties
    
    public let input: RocketListModuleInput
    public let viewController: UIViewController
    
    // MARK: - Private Properties
    
    private(set) weak var router: RocketListRouterInput!
    
    // MARK: - Public Methods
    
    public static func assemble(with context: RocketListContext) -> RocketListAssembly {
        let router = RocketListRouter()
        let interactor = RocketListInteractor(networkManager: context.networkManager)
        let presenter = RocketListPresenter(router: router, interactor: interactor)
        let viewController = RocketListViewController(presenter: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.presenter = presenter
        router.viewController = viewController
        router.presenter = presenter
        
        return RocketListAssembly(view: viewController, input: presenter, router: router)
    }
    
    // MARK: - Init
    
    private init(view: UIViewController, input: RocketListModuleInput, router: RocketListRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

public struct RocketListContext {
    weak var moduleOutput: RocketListModuleOutput?
    let networkManager: NetworkManagerProtocol
}
