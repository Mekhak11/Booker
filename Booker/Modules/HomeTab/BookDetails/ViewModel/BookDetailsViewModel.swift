//
//  BookDetailsViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class BookDetailsViewModel: BookDetailsViewModeling, Identifiable {
    
    private var likeUnlikeUseCase: ArticleLikeUnlikeUseCase
    private var cancelables = Set<AnyCancellable>()

    init(likeUnlikeUseCase: ArticleLikeUnlikeUseCase) {
        self.likeUnlikeUseCase = likeUnlikeUseCase
    }
    
    func likeArticle(id: Int, complition: @escaping () -> ()) {
        complition()
        likeUnlikeUseCase.likeArticle(id: id)
            .sink { [weak self] result in
                
                switch result {
                case .finished:
                    print("")
                case .failure(let error):
                   // self?.error = error as? RequestServiceError
                    print(error)
                }
            } receiveValue: { [weak self]  lk in
                print(lk)
               
            }.store(in: &cancelables)
    }
    
    func unlikeArticle(id: Int, complition: @escaping () -> ()) {
        complition()
    likeUnlikeUseCase.unlikeArticle(id: id)
        .sink { [weak self] result in
            
            switch result {
            case .finished:
                print("")
            case .failure(let error):
               // self?.error = error as? RequestServiceError
                print(error)
            }
        } receiveValue: { [weak self]  lk in
            print(lk)
            
        }.store(in: &cancelables)
    }
    
    
}
