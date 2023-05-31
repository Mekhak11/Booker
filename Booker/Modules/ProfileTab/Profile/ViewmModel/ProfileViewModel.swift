//
//  ProfileViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine


final class ProfileViewModel: ProfileViewModeling, Identifiable {
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var user: WriterDetailsModel = WriterDetailsModel()
    
    private var cancelables = Set<AnyCancellable>()
    private var getMeUseCase: GetMeUseCsae
    
    init(getMeUseCase: GetMeUseCsae) {
        self.getMeUseCase = getMeUseCase
    }
    
    func getMe() {
        isLoading = true
        getMeUseCase.execute()
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
            } receiveValue: { [weak self]  user in
                self?.user = user
            }.store(in: &cancelables)
    }
    
    
}
