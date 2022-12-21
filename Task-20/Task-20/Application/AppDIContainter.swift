//
//  AppDIContainter.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//

import Foundation

/// Simple DI containter.
final class AppDIContainter {
    
    static let shared = AppDIContainter()
    
    private init() {}
    
    private let networkManager: NetworkManagerProtocol = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let networkManager = NetworkManager(session: session)
        return networkManager
    }()
    
    func resolveNetworkManager() -> NetworkManagerProtocol {
        return networkManager
    }
}
