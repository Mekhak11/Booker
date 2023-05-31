//
//  WritersDetailsViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation

protocol WritersDetailsViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    
    var books: [BookDetailsModel] { get set }
    
    func getBooks(by id: Int,complition: @escaping ()->())
}
