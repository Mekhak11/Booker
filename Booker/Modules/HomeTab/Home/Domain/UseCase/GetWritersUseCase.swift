//
//  GetWritersUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 07.05.23.
//

import Foundation
import Combine

final class GetWritersUseCase: AuthUseCase {
    func execute() -> AnyPublisher<[WriterDetailsModel], Error> {
        authRepository.getWriters()
            .map { writer in
                writer.map {
                    WriterDetailsModel(dto: $0)
                }
                
            }.eraseToAnyPublisher()
    }
}
