//
//  FavoriteWritersViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class FavoriteWritersViewModel: FavoriteWritersViewModeling, Identifiable {

    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var writers: [WriterDetailsModel] = []
    
    private var cancelables = Set<AnyCancellable>()
    private var getFavoriteWritersUseCase: GetFavoriteWritersUseCase
    
    init(getFavoriteWritersUseCase: GetFavoriteWritersUseCase) {
        self.getFavoriteWritersUseCase = getFavoriteWritersUseCase
    }
    
    func getMyWriters() {
        isLoading = true
        getFavoriteWritersUseCase.execute()
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
            } receiveValue: { [weak self]  writers in
                self?.writers = writers
            }.store(in: &cancelables)
    }
    
}
