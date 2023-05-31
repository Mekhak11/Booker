//
//  WriterModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import Foundation

struct WriterModel: Identifiable {
    let id: UUID
    let name: String
    let surname: String
    let dateOfBirth: Date
    let imageUrl: String?
    var isLiked: Bool
    var postNumber: Int
    
    init(id: UUID, name: String, surname: String, dateOfBirth: Date, imageUrl: String?, isLiked: Bool, postNumber: Int) {
        self.id = id
        self.name = name
        self.surname = surname
        self.dateOfBirth = dateOfBirth
        self.imageUrl = imageUrl
        self.isLiked = isLiked
        self.postNumber = postNumber
    }
    
    init() {
        self.id = UUID()
        self.name = "Whiliam"
        self.surname = "Shekspir"
        self.dateOfBirth = Date()
        self.imageUrl = nil
        self.isLiked = true
        self.postNumber = 4
    }
    
}
