//
//  RequestManager.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation


import Foundation

enum RequestServices {
    
    enum Auth {
        static let baseUrl: URL = URL(string: "http://book.loca.lt")!
        static let apiQueue: DispatchQueue = .init(label: "http://book.loca.lt", qos: .default, attributes: .concurrent)
    }
}
