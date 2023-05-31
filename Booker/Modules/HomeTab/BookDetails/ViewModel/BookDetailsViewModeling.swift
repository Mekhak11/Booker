//
//  BookDetailsViewModeling.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation

protocol BookDetailsViewModeling: ObservableObject {
    func likeArticle(id: Int, complition: @escaping ()->())
    func unlikeArticle(id: Int, complition: @escaping ()->())
    
}
