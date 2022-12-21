//
//  NetworkRequest.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 21.12.2022.
//

struct NetworkRequest {
    var endpoint: Endpoint
    var method: HTTPMethod = .get
    var httpHeaderFields: [String: String] = [:]
}
