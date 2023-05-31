//
//  SignInUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 09.05.23.
//

import Foundation
import Combine

final class SignInUseCase: AuthUseCase {
    func execute(payload: SignInPayload) -> AnyPublisher<TokenDto, Error> {
        authRepository.signIn(payload: payload)
            .eraseToAnyPublisher()
    }
}
