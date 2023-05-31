//
//  GetBooksUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class GetAllBooksUseCase: AuthUseCase {
    func execute() -> AnyPublisher<[BookDetailsModel], Error> {
        authRepository.getAllBooks()
            .map { book in
                book.map {
                    BookDetailsModel(dto: $0)
                }
            }.eraseToAnyPublisher()
    }
}
