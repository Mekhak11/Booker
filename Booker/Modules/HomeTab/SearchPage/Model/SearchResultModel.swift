//
//  SearchResultModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 10.05.23.
//

import Foundation

struct SearchResultModel {
    var writers: [WriterDetailsModel]
    var books: [BookDetailsModel]
    
    init(writers: [WriterDetailsModel], books: [BookDetailsModel]) {
        self.writers = writers
        self.books = books
    }
    
    init() {
        self.writers = []
        self.books = []
    }
    
    init(dto: SearchResultDto) {
        self.writers = dto.userList.map({WriterDetailsModel(dto: $0)})
        self.books = dto.articleList.map({BookDetailsModel(dto: $0)})
    }
}
