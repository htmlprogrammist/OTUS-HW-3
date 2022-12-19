//
//  RocketListPresenter.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//

import Foundation

final class RocketListPresenter {
    weak var view: RocketListViewInput?
    weak var moduleOutput: RocketListModuleOutput?
    
    // MARK: - Private Properties
    
    private let router: RocketListRouterInput
    private let interactor: RocketListInteractorInput
    
    // MARK: - Init
    
    init(router: RocketListRouterInput, interactor: RocketListInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension RocketListPresenter: RocketListModuleInput {
}

extension RocketListPresenter: RocketListViewOutput {
    func viewDidLoad() {
        interactor.requestData()
    }
    
    func didSelect(rocket: Rocket) {
        
    }
}

extension RocketListPresenter: RocketListInteractorOutput {
    func dataDidRecieved(data: [Rocket]) {
        DispatchQueue.main.async {
            self.view?.showData(data: data)
        }
    }
    
    func handleError(error: NetworkManagerError) {
        DispatchQueue.main.async {
            switch error {
            case .networkError:
                self.view?.showAlert(title: "Unstable internet connection", message: "Please, check your connection and then try again or use a different network")
            case .parsingJSONError:
                self.view?.showAlert(title: "Server error occured", message: "An incorrect response was received from the server. Please, restart the application or try again later")
            default:
                self.view?.showAlert(title: "An unexpected error has occurred", message: "Please, restart application or wait for about 10-15 minutes")
            }
        }
    }
}

extension RocketListPresenter: RocketListRouterOutput {
}
