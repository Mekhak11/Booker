//
//  HomeViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 07.05.23.
//

import Foundation

protocol HomeViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var writers: [WriterDetailsModel] { get set }
    var lastWriters: [WriterDetailsModel] { get set }
    var books: [BookDetailsModel] { get set }
    
    func getWriters()
    func getBooks()
}
