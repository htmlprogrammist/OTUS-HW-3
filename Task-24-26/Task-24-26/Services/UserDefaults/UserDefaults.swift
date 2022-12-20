//
//  UserDefaults.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import Foundation

extension UserDefaults {
    /// Contains array of user's favourite recipes.
    @UserDefault(key: "cachedTodos", defaultValue: [Todo]())
    static var cachedTodos: [Todo]
}
