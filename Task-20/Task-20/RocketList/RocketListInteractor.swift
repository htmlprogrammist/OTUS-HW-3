//
//  RocketListInteractor.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//

import Foundation

final class RocketListInteractor {
    weak var presenter: RocketListInteractorOutput?
    private let networkManager: NetworkManagerProtocol
    
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
}

extension RocketListInteractor: RocketListInteractorInput {
    func requestData() {
        let request = NetworkRequest(urlString: "https://api.spacexdata.com/v4/rockets")
        networkManager.perform(request: request) { [unowned self] (result: Result<[Rocket], NetworkManagerError>) in
            switch result {
            case .success(let rockets):
                presenter?.dataDidRecieved(data: rockets)
            case .failure(let error):
                presenter?.handleError(error: error)
            }
        }
    }
}
