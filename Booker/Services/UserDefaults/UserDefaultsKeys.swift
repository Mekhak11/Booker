//
//  UserDefaultsKeys.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import Foundation

extension UserDefaults {
    
    struct Key: RawRepresentable {
        var rawValue: String
    }
}

extension UserDefaults.Key {
    struct User {
        static let posts  = UserDefaults.Key(rawValue: "q")
        static let token  = UserDefaults.Key(rawValue: "token")
        static let isLoggedIn = UserDefaults.Key(rawValue: "isLoggedIn")
        static let userModel = UserDefaults.Key(rawValue: "userModel")
        
    }
}
