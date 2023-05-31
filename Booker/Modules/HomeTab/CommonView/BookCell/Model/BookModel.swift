//
//  BookModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 28.03.23.
//

import Foundation

struct BookPreviewModel: Identifiable {
    var id: UUID
    var title: String
    var author: WriterModel
     
    init(id: UUID, title: String, author: WriterModel) {
        self.id = id
        self.title = title
        self.author = author
    }
    
    init() {
        self.id = UUID()
        self.title = "King Arthur"
        self.author = WriterModel()
    }
}
