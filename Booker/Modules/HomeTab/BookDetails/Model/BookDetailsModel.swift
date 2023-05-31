//
//  BookDetailsModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.04.23.
//

import Foundation

struct BookDetailsModel: Identifiable,Codable {
    var id: Int
    var title: String
    var author: String
    var published: Date
    var details: String
    var isLiked: Bool
    var likeCount: Int
    
    init(id: Int, title: String, author: String, published: Date, details: String) {
        self.id = id
        self.title = title
        self.author = author
        self.published = published
        self.details = details
        self.isLiked = false
        self.likeCount = 0
    }
    init() {
        self.id = 0
        self.title = "King Arthur"
        self.author = "William Shekspir"
        self.published = Date()
        self.details = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuestibulum morbi blandit cursus risus at ultrices. Interdum posuere lorem ipsum dolor sit. Gravida cum sociis natoque penatibus et. Sed viverra ipsum nunc aliquet bibendum enim facilisis. Dui sapien eget mi proin. Feugiat vivamus at augue eget arcu. Tempor commodo ullamcorper a lacus. Quis enim lobortis scelerisque fermentum dui faucibus. Nunc sed blandit libero volutpat sed cras ornare arcu dui. Ornare suspendisse sed nisi lacus sed"
        self.isLiked = false
        self.likeCount = 0
    }
    init(dto: BookDetailsDto) {
        self.id = dto.id
        self.title = dto.title
        self.author = dto.authorName
        self.details = dto.text
        self.published = Date()
        self.isLiked = dto.liked
        self.likeCount = dto.likeCount
    }
}

struct BookDetailsDto: Codable {
    let id: Int
    let title: String
    let userId: Int
    let authorName, text: String
    let likeCount: Int
    let liked: Bool
}
