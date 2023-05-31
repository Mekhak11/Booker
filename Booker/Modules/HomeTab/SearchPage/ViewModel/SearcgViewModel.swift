//
//  SearcgViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 10.05.23.
//

import Foundation
import Combine

final class SearcgViewModel: SearcgViewModeling {
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    
    @Published var result: SearchResultModel = SearchResultModel()
    
    private var searchUseCase: SearchUseCase
    private var cancelables = Set<AnyCancellable>()
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }
    
    func search(searchWord: String) {
        searchUseCase.execute(searchWord: searchWord)
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
            } receiveValue: { [weak self]  res in
                self?.result = res
            }.store(in: &cancelables)
    }
    
    
}
