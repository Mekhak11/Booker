//
//  LikeUseCase.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final  class LikeUseCase: AuthUseCase {
    func like(id: Int) -> AnyPublisher<Bool, Error> {
        authRepository.like(id: id)
            .eraseToAnyPublisher()
    }
    func unLike(id: Int) -> AnyPublisher<Bool, Error> {
        authRepository.unLike(id: id)
            .eraseToAnyPublisher()
    }
    
}
