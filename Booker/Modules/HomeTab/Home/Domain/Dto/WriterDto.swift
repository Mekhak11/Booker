//
//  WriterDto.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 07.05.23.
//

import Foundation

struct WriterDto: Codable {
        var id: Int
        var firstName, lastName, email, description: String?
        var posts: Int?
        var dateOfBirth, mainGenre: String?
        var liked: Bool?
    
}
