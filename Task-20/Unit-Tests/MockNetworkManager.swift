//
//  MockNetworkManager.swift
//  Unit-Tests
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import Foundation
@testable import Task_20

final class MockNetworkManager: NetworkManagerProtocol {
    
    var isSuccessful: Bool!
    var data = [Rocket]()
    
    var session: URLSession = URLSession(configuration: URLSessionConfiguration.default)
    
    func perform<Model: Codable>(request: NetworkRequest, completion: @escaping (Result<Model, NetworkManagerError>) -> Void) {
        if isSuccessful {
            completion(.success(data as! Model))
        } else {
            completion(.failure(.networkError))
        }
    }
}
