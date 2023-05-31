//
//  SearchResultDto.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 10.05.23.
//

import Foundation

struct SearchResultDto: Codable {
    var userList: [WriterDto]
    var articleList: [BookDetailsDto]
}
