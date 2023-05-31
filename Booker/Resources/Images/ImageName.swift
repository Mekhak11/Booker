//
//  ImageName.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import Foundation
import SwiftUI

extension Image {
    
    public struct TabBar {
        public static var home: Image {
            return Image("tabbar.home")
        }
        public static var homeSelected: Image {
            return Image("tabbar.home.filed")
        }
        public static var plus: Image {
            return Image("tabbar.plus")
        }
        public static var profile: Image {
            return Image("tabbar.profile")
        }
        public static var profileSelected: Image {
            return Image("tabbar.profile.filled")
        }
    }
    public struct Cell {
        public static var liked: Image {
            return Image("cell.Liked")
        }
        public static var notLiked: Image {
            return Image("cell.notLiked")
        }
    }
    public struct BookCell {
        public static var bookCell: Image {
            return Image("book.cover")
        }
        public static var shadowUnder: Image {
            return Image("shadow.under")
        }
        public static var shadowUpper: Image {
            return Image("shadow.uper")
        }
    }
    
}
