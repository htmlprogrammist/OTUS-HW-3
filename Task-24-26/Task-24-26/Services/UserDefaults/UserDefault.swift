//
//  UserDefault.swift
//  Task-24-26
//
//  Created by Егор Бадмаев on 20.12.2022.
//

import Foundation

@propertyWrapper
public struct UserDefault<T: Codable> {
    /// Key for user default setting.
    let key: String
    /// Default value for user default setting.
    let defaultValue: T
    /// UserDefaults container. `.standard` by default.
    var container: UserDefaults = .standard
    
    // MARK: - Init
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    // MARK: - Public Properties
    
    /// Wrapper of value to deal with `defaultValue` and different cases of usage.
    public var wrappedValue: T {
        get {
            if let data = container.object(forKey: key) as? Data,
               let user = try? JSONDecoder().decode(T.self, from: data) {
                return user
            }
            return defaultValue
        }
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                container.set(encoded, forKey: key)
            }
        }
    }
}
