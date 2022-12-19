//
//  RocketDetailsAssembly.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  
//

import UIKit

public final class RocketDetailsAssembly {
    
    // MARK: - Public Properties
    
    public let input: RocketDetailsModuleInput
    public let viewController: UIViewController
    
    // MARK: - Private Properties
    
    private(set) weak var router: RocketDetailsRouterInput!
    
    // MARK: - Public Methods
    
    public static func assemble(with context: RocketDetailsContext) -> RocketDetailsAssembly {
        let router = RocketDetailsRouter()
        let interactor = RocketDetailsInteractor(rocket: context.rocket)
        let presenter = RocketDetailsPresenter(router: router, interactor: interactor)
        let viewController = RocketDetailsViewController(presenter: presenter)
        
        presenter.view = viewController
        presenter.moduleOutput = context.moduleOutput
        
        interactor.presenter = presenter
        router.viewController = viewController
        router.presenter = presenter
        
        return RocketDetailsAssembly(view: viewController, input: presenter, router: router)
    }
    
    // MARK: - Init
    
    private init(view: UIViewController, input: RocketDetailsModuleInput, router: RocketDetailsRouterInput) {
        self.viewController = view
        self.input = input
        self.router = router
    }
}

public struct RocketDetailsContext {
    weak var moduleOutput: RocketDetailsModuleOutput?
    let rocket: Rocket
}
