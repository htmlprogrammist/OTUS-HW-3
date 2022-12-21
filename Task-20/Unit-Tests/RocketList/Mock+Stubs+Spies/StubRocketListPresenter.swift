//
//  StubRocketListPresenter.swift
//  Unit-Tests
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import Foundation
@testable import Task_20

class StubRocketListPresenter: RocketListInteractorOutput {
    
    var interactor: RocketListInteractor!
    
    var recievedData: [Rocket]!
    var recievedError: NetworkManagerError!
    
    func dataDidRecieved(data: [Rocket]) {
        recievedData = data
    }
    
    func handleError(error: NetworkManagerError) {
        recievedError = error
    }
}
