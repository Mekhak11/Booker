//
//  AppFont.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 10.05.23.
//

import Foundation
import SwiftUI
struct AppFont {
    struct Koho {
        
        static let name = "KoHo-ExtraLight"
        
        struct ExtraBig {
            
            static let medium     = Font.custom(name, size: 100).weight(.light)
        }
        
        struct SuperBig {
            
            static let medium       = Font.custom(name, size: 40).weight(.medium)
            static let large        = Font.custom(name, size: 40).weight(.bold)
            static let regular      = Font.custom(name, size: 20).weight(.regular)
            static let bold         = Font.custom(name, size: 30).weight(.bold)
        }
        
        struct Big {
            
            static let bold         = Font.custom(name, size: 24).weight(.bold)
            // Font.system(size: 25, weight: Font.Weight.bold, design: Font.Design.rounded) // 20
            static let medium       = Font.custom(name, size: 24).weight(.medium)
            // Font.system(size: 30, weight: Font.Weight.medium, design: Font.Design.rounded) // 24
            static let regular      = Font.custom(name, size: 20).weight(.bold)
        }
        
        struct NormalBig {
            
            static let bold         = Font.custom(name, size: 17).weight(.semibold)
            static let regular      = Font.custom(name, size: 18).weight(.regular)
            static let titleBold      = Font.custom(name, size: 18).weight(.bold)
            // Font.system(size: 20, weight: Font.Weight.semibold, design: Font.Design.rounded) // 16
        }
        
        struct Normal {
            
            static let bold         = Font.custom(name, size: 16).weight(.bold)
            // Font.system(size: 17, weight: Font.Weight.bold, design: Font.Design.rounded) // 14
            static let regular      = Font.custom(name, size: 16).weight(.regular)
            // Font.system(size: 17, weight: Font.Weight.regular, design: Font.Design.rounded) // 14
            static let regularUI    = UIFont(name: name, size: 16)!
        }
        
        struct Small {
            
            static let bold      = Font.custom(name, size: 14).weight(.bold)
            static let commonRegular = Font.custom(name, size: 14).weight(.regular)
            // Font.system(size: 15, weight: Font.Weight.regular, design: Font.Design.rounded) // 12
            static let regular      = Font.custom(name, size: 13).weight(.regular)
            static let small      = Font.custom(name, size: 12).weight(.bold)
            
        }
        
        struct SuperSmall {
            
            static let regular      = Font.custom(name, size: 11).weight(.regular)
            // Font.system(size: 12, weight: Font.Weight.regular, design: Font.Design.rounded) // 10
        }
    }
}

