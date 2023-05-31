//
//  RegisterUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation
import Combine

final class RegisterUseCase: AuthUseCase {
    func execute(payload: RegistrationPayload) -> AnyPublisher<TokenDto,Error> {
        authRepository.register(payload: payload)
            .eraseToAnyPublisher()
    }
}
