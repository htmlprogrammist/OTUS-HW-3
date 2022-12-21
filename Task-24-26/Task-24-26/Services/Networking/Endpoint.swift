//
//  Endpoint.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import Foundation

/// An endpoint is an access to a route by a separate HTTP method. The endpoint performs a specific task, accepts parameters and returns data to the client.
struct Endpoint {
    /// Path to an endpoint.
    let path: String
    /// Parameters for an endpoint.
    var paratemets: [String: String] = [:]
    
    // MARK: - Public Properties
    
    /// Property that computes the `url` of the instance.
    public var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/" + path
        components.queryItems = paratemets.map { URLQueryItem(name: $0.key, value: $0.value) }
        return components.url
    }
}

extension Endpoint {
    static func random() -> Self {
        return Endpoint(path: "todos")
    }
    
    static func concrete(by id: Int) -> Self {
        return Endpoint(path: "todos/\(id)",
                        paratemets: [:]
        )
    }
}
