//
//  HomeViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 07.05.23.
//

import Foundation
import Combine

final class HomeViewModel: HomeViewModeling, Identifiable {
    @Published var books: [BookDetailsModel] = []
    
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var writers: [WriterDetailsModel] = []
    
    @Published var lastWriters: [WriterDetailsModel] = []
    
    private var getWritersUSeCase: GetWritersUseCase
    private var getBooksUseCase: GetAllBooksUseCase
    private var cancelables = Set<AnyCancellable>()

    init(getWritersUSeCase: GetWritersUseCase, getBooksUseCase: GetAllBooksUseCase) {
        self.getWritersUSeCase = getWritersUSeCase
        self.getBooksUseCase = getBooksUseCase
    }
    
    func getWriters() {
        getWritersUSeCase.execute()
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
                self?.lastWriters = writers.suffix(3)
            }.store(in: &cancelables)
    }
    
    func getBooks() {
        getBooksUseCase.execute()
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
            } receiveValue: { [weak self]  books in
                self?.books = books
            }.store(in: &cancelables)
    }
    
}
