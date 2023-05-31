//
//  SignInViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 09.05.23.
//

import Foundation
import Combine

final class SignInViewModel: SignInViewModeling, Identifiable {

    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var isContentValid: Bool = false
    
    @Published var payload: SignInPayload = SignInPayload(username: "", password: "")
    
    private var signInUseCase: SignInUseCase
    private var cancelables = Set<AnyCancellable>()
    private var isResetModelVaid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($payload, $isLoading )
            .map { payload, isLoading in
                self.validate(payload: payload) && isLoading == false
            }.eraseToAnyPublisher()
    }
    
    init(signInUseCase: SignInUseCase) {
        self.signInUseCase = signInUseCase
        isResetModelVaid
              .receive(on: RunLoop.main)
              .assign(to: \.isContentValid, on: self)
              .store(in: &cancelables)
    }
    
    private func validate(payload: SignInPayload) -> Bool {
        return payload.password.count >= 8 && payload.username.isValidEmail()
    }
    
    func signIn(complition: @escaping ()->()) {
        isLoading = true
        signInUseCase.execute(payload: payload)
              .sink { [weak self] result in
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                }
                switch result {
                case .finished:
                    print("")
                case .failure(let error):
                    self?.error = error as? RequestServiceError
                    print(self?.error)
                }
            } receiveValue: { [weak self]  tk in
              print(tk)
                UserDefaultsService().setObject(tk, forKey: .User.token)
                UserDefaultsService().setPrimitive(true, forKey: .User.isLoggedIn)
                complition()
                
            }.store(in: &cancelables)
    }
    
    
}

