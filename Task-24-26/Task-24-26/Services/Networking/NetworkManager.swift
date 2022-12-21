//
//  NetworkManager.swift
//  Task-20
//
//  Created by Егор Бадмаев on 19.12.2022.
//  https://jsonplaceholder.typicode.com/todos

import Foundation

protocol NetworkManagerProtocol {
    var session: URLSession { get set }
    func perform<Model: Codable>(request: NetworkRequest, completion: @escaping (Result<Model, NetworkManagerError>) -> Void)
}

final class NetworkManager: NetworkManagerProtocol {
    
    public var session: URLSession
    private let decoder = JSONDecoder()
    
    init(session: URLSession) {
        self.session = session
    }
    
    public func perform<Model: Codable>(request: NetworkRequest, completion: @escaping (Result<Model, NetworkManagerError>) -> Void) {
        
        guard let url = request.endpoint.url else {
            completion(.failure(NetworkManagerError.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.httpHeaderFields
        
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
            
            /// We use the capture list in order to avoid reference-cycle or/and application crashes.
            /// `[weak self]` - creating a **weak** reference to `self`, thereby avoiding reference-cycle/crash
            /// Then we create a `strongSelf` - a strong reference to `self` inside the block, so we guarantee that the block will be executed to the end, since the instance of the class will not be able to reset, and we also avoid problems with optionals
            guard let strongSelf = self else {
                completion(.failure(NetworkManagerError.retainCycle))
                return
            }
            
            guard error == nil, let data = data else {
                completion(.failure(NetworkManagerError.networkError))
                return
            }
            
            guard let model = try? strongSelf.decoder.decode(Model.self, from: data) else {
                completion(.failure(NetworkManagerError.parsingJSONError))
                return
            }
            
            completion(.success(model.self))
        })
        
        dataTask.resume()
    }
}
