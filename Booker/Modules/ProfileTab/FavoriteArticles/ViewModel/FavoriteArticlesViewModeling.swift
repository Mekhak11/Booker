//
//  FavoriteArticlesViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation

protocol FavoriteArticlesViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var articles: [BookDetailsModel] { get set }
    
    func getMyArticles()
}
