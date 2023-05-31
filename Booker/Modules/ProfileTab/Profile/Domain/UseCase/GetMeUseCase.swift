//
//  GetMeUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class GetMeUseCsae: AuthUseCase {
    func execute() -> AnyPublisher<WriterDetailsModel, Error> {
        authRepository.getMe()
            .map {
                WriterDetailsModel(dto: $0)
            }.eraseToAnyPublisher()
    }
    
}
