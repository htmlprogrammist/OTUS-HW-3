//
//  RocketDetailsPresenter.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  
//

import Foundation

final class RocketDetailsPresenter {
    weak var view: RocketDetailsViewInput?
    weak var moduleOutput: RocketDetailsModuleOutput?
    
    // MARK: - Private Properties
    
    private let router: RocketDetailsRouterInput
    private let interactor: RocketDetailsInteractorInput
    
    // MARK: - Init
    
    init(router: RocketDetailsRouterInput, interactor: RocketDetailsInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension RocketDetailsPresenter: RocketDetailsModuleInput {
}

extension RocketDetailsPresenter: RocketDetailsViewOutput {
}

extension RocketDetailsPresenter: RocketDetailsInteractorOutput {
}

extension RocketDetailsPresenter: RocketDetailsRouterOutput {
}
