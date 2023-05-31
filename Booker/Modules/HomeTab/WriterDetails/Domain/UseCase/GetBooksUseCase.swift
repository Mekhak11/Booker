//
//  GetBooksUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class GetWriterBooksUseCase: AuthUseCase {
    func execute(id: Int) -> AnyPublisher<[BookDetailsModel], Error> {
        authRepository.getAuthorBooks(id: id)
            .map { book in
                book.map {
                    BookDetailsModel(dto: $0)
                }
            }.eraseToAnyPublisher()
    }
}
