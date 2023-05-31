//
//  PostArticleUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class PostArticleUseCase: AuthUseCase {
    func execute(payload: ArticlePayload) -> AnyPublisher<Bool,Error> {
        authRepository.postArticle(payload: payload)
            .eraseToAnyPublisher()
    }
}
