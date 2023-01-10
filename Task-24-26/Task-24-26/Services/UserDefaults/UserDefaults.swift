//
//  UserDefaults.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import Foundation

extension UserDefaults {
    @UserDefault(key: "cachedTodos", defaultValue: [Todo]())
    static var cachedTodos: [Todo]
}
