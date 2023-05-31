//
//  FavoriteWritersViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation

protocol FavoriteWritersViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var writers: [WriterDetailsModel] { get set }
    
    func getMyWriters()
}
