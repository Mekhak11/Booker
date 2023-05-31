//
//  TabItem.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import Foundation

import SwiftUI

enum TabItem: Int, Codable, CaseIterable {
    
    case home = 1
    case add = 2
    case profile = 3
    
    var selectedImage: Image {
        switch self {
        case .home:
            return .TabBar.homeSelected
        case .add:
            return .TabBar.plus
        case .profile:
            return .TabBar.profileSelected
        }
    }
    
    var unselectedImage: Image {
        switch self {
        case .home:
            return .TabBar.home
        case .add:
            return .TabBar.plus
        case .profile:
            return .TabBar.profile
        }
    }
}

