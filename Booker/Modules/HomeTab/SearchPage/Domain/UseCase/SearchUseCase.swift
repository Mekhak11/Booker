//
//  SearchUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 10.05.23.
//

import Foundation
import Combine

final class SearchUseCase: AuthUseCase {
    func execute(searchWord: String) -> AnyPublisher<SearchResultModel, Error> {
        authRepository.search(searchWord: searchWord)
            .map {
                SearchResultModel(dto: $0)
            }.eraseToAnyPublisher()
    }
}
