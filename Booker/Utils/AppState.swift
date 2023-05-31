//
//  AppState.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation

class AppState: ObservableObject {
    
    @Published var contentState: ContentView.ContentState = .onboarding
    
    init() {
        let localStorage = UserDefaultsService()
        let isLoggedin: Bool? = localStorage.getPrimitive(forKey: .User.isLoggedIn)
        contentState = isLoggedin ?? false ? .inApp : .onboarding
    }
}

extension ContentView {
    
    enum ContentState: Equatable, Identifiable, CustomStringConvertible  {
        case onboarding
        case signIn
        case inApp
    
        
        var id: String { self.rawValue }
        var description: String { self.rawValue }
        
        var rawValue: String {
            switch self {

            case .signIn: return "signIn"
            case .inApp: return "inApp"
            case .onboarding: return "onboarding"
            }
        }
    }
}

