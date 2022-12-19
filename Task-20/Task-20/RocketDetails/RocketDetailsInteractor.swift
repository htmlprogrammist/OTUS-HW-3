//
//  RocketDetailsInteractor.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  
//

import Foundation

final class RocketDetailsInteractor {
    weak var presenter: RocketDetailsInteractorOutput?
    let rocket: Rocket
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
}

extension RocketDetailsInteractor: RocketDetailsInteractorInput {
    func requestData() {
        presenter?.dataDidReceived(data: rocket)
    }
}
