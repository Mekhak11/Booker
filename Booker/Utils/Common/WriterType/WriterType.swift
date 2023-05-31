//
//  WriterType.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation
import SwiftUI

enum WriterType: String, CaseIterable, Codable {
    case romantic  = "Romantic"
    case realistic = "Realistic"
    case fantastic = "Fantastic"
    case abstract = "Abstract"
    
    var image: Image {
        switch self {
        case .romantic:
            return Image("type.romantic")
        case .realistic:
            return Image("type.realistic")
        case .fantastic:
            return Image("type.fantastic")
        case .abstract:
            return Image("type.abstract")
        }
    }
}
