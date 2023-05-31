//
//  WriterDetailsModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.04.23.
//

import Foundation
import SwiftUI


struct WriterDetailsModel: Identifiable, Codable {
    var id: Int
    var firstName:String
    var lastName: String
    var biography: String
    var email: String
    var gender: String
    var type: WriterType
    var books: [BookDetailsModel]
    //var image: Image
    var postsNumber: Int
    var dateOfBirth:String
    var isLiked: Bool
    
    init(id: Int, firstName: String, lastName: String, biography: String, books: [BookDetailsModel], image: Image, email: String, gender:String, type: WriterType,posts: Int, dateOfBirth: Date, isLiked: Bool) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.biography = biography
        self.books = books
       // self.image = image
        self.gender = gender
        self.type = type
        self.email = email
        self.postsNumber = posts
        self.dateOfBirth = dateOfBirth.toString()
        self.isLiked = isLiked
    }
    init() {
        self.id = 0
        self.firstName = "Wiliam"
        self.lastName = "Shekspir"
        self.biography = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuestibulum morbi blandit cursus risus at ultrices. Interdum posuere lorem ipsum dolor sit. Gravida cum sociis natoque penatibus et. Sed viverra ipsum nunc aliquet bibendum enim facilisis. Dui sapien eget mi proin. Feugiat vivamus at augue eget arcu. Tempor commodo ullamcorper a lacus. Quis enim lobortis scelerisque fermentum dui faucibus. Nunc sed blandit libero volutpat sed cras ornare arcu dui. Ornare suspendisse sed nisi lacus sed"
        self.books = []
       // self.image = Image("author")
        self.email = "jhbsa@gmail.com"
        self.type = .romantic
        self.gender = "Male"
        self.postsNumber = 100
        self.dateOfBirth = ""
        self.isLiked = false
    }
    
    init(dto: WriterDto) {
        self.id = dto.id
        self.firstName = dto.firstName ?? ""
        self.lastName = dto.lastName ?? ""
        self.email = dto.email ?? ""
        self.biography = dto.description ?? ""
        self.books = []
        self.type = WriterType(rawValue: dto.mainGenre ?? "") ?? .abstract
        self.gender = ""
        //self.image = self.type.image
        self.postsNumber = dto.posts ?? 0
        self.dateOfBirth = dto.dateOfBirth ?? ""
        self.isLiked = dto.liked ?? false
    }
}
