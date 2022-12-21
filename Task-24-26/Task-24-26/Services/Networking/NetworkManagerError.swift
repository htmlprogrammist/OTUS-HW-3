//
//  NetworkManagerError.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 21.12.2022.
//

enum NetworkManagerError: Error {
    case invalidURL
    case retainCycle
    case networkError
    case parsingJSONError
}
