//
//  GetMyArticlesUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class GetMyArticlesUseCase: AuthUseCase {
    func execute() -> AnyPublisher<[BookDetailsModel], Error> {
        authRepository.getMyArticles()
            .map { article in
                article.map {
                    BookDetailsModel(dto: $0)
                }
            }.eraseToAnyPublisher()
    }
}
