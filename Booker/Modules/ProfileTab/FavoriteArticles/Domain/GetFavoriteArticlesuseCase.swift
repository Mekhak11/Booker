//
//  GetFavoriteArticlesuseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Foundation
import Combine

final class GetFavoriteArticlesuseCase: AuthUseCase {
    func execute() -> AnyPublisher<[BookDetailsModel], Error> {
        authRepository.getFavoriteArticles()
            .map { book in
                book.map {
                    BookDetailsModel(dto: $0)
                }
            }.eraseToAnyPublisher()
    }
}
