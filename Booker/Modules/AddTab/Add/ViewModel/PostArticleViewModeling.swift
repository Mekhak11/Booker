//
//  PostArticleViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation

protocol PostArticleViewModeling: ObservableObject {
    var isLoading: Bool { get set }
    var error: RequestServiceError? { get set }
    var success: String? { get set }
    
    func postArticle(payload: ArticlePayload, complition: @escaping ()->())
    
}
