//
//  ArticleLikeUnlikeUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class ArticleLikeUnlikeUseCase: AuthUseCase {
    func likeArticle(id: Int) -> AnyPublisher<Bool,Error> {
        authRepository.likeArticle(id: id)
            .eraseToAnyPublisher()
    }
    func unlikeArticle(id: Int)  -> AnyPublisher<Bool,Error> {
        authRepository.unlikeArticle(id: id)
            .eraseToAnyPublisher()
    }
}
