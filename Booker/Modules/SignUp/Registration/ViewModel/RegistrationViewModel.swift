//
//  RegistrationViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import Foundation
import Combine

final class RegistrationViewModel: RegitrationViewModeling, Identifiable {
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var payload: RegistrationPayload = RegistrationPayload()
    @Published var confirmPass: String = ""
    @Published var isContentValid: Bool = false
//    @Published var firstName: String =
    @Published var dateOfBirth: Date = Date()
    @Published var writerType: WriterType? = nil

    
    private var isResetModelVaid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($payload, $confirmPass )
            .map { payload, confPass in
                self.validate(payload: payload) && confPass.count >= 8
            }.eraseToAnyPublisher()
    }
    private var registrationUSeCase: RegisterUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(registrationUSeCase: RegisterUseCase) {
        self.registrationUSeCase = registrationUSeCase
        isResetModelVaid
              .receive(on: RunLoop.main)
              .assign(to: \.isContentValid, on: self)
              .store(in: &cancelables)
    }
    
    private func validate(payload: RegistrationPayload) -> Bool {
        return payload.password == confirmPass && payload.email.isValidEmail() && !payload.lastname.isEmpty &&
        !payload.firstname.isEmpty && writerType != nil && dateOfBirth != Date()
    }
    
    func register(complition: @escaping ()->()) {
        self.isLoading = true
        payload.dateOfBirth = dateOfBirth.toString(format: .custom("yyyy-MM-dd'T'HH:mm:ssZ"))
        payload.mainGenre = writerType?.rawValue ?? "Romantic"
        registrationUSeCase.execute(payload: payload)
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
