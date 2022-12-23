//
//  Todo.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

protocol TodoProtocol {
    var title: String { get }
    var completed: Bool { get }
}

struct Todo: TodoProtocol, Codable {
    let userID, id: Int
    let title: String
    let completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

extension Todo: Equatable {
    public static func == (lhs: Todo, rhs: Todo) -> Bool {
        lhs.id == rhs.id
    }
}
