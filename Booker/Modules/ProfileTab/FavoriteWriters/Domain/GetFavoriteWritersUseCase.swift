//
//  GetFavoriteWritersUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class GetFavoriteWritersUseCase: AuthUseCase {
    func execute() -> AnyPublisher<[WriterDetailsModel], Error> {
        authRepository.getFavoriteWriters()
            .map { writer in
                writer.map {
                    WriterDetailsModel(dto: $0)
                }
            }.eraseToAnyPublisher()
    }
}
