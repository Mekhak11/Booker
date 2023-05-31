//
//  WriterDetailsViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class WriterDetailsViewModel: WritersDetailsViewModeling, Identifiable {
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var books: [BookDetailsModel] = []
    
    private var getWriterBooksUseCase: GetWriterBooksUseCase
    private var cancelables = Set<AnyCancellable>()
    
    init(getWriterBooksUseCase: GetWriterBooksUseCase) {
        self.getWriterBooksUseCase = getWriterBooksUseCase
    }
    
    
    func getBooks(by id: Int,complition: @escaping ()->()) {
        getWriterBooksUseCase.execute(id: id)
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
            } receiveValue: { [weak self]  bk in
                self?.books = bk
                complition()
                
            }.store(in: &cancelables)
    }
    
    
}
