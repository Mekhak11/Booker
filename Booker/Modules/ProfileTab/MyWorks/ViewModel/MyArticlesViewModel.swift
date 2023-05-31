//
//  MyArticlesViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class MyArticlesViewModel: MyArticlesViewModeling, Identifiable {

    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var articles: [BookDetailsModel] = []
    
    private var cancelables = Set<AnyCancellable>()
    private var getMyArticlesUseCase: GetMyArticlesUseCase
    
    init(getMyArticlesUseCase: GetMyArticlesUseCase) {
        self.getMyArticlesUseCase = getMyArticlesUseCase
    }
    
    func getMyArticles() {
        isLoading = true
        getMyArticlesUseCase.execute()
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
            } receiveValue: { [weak self]  articles in
                self?.articles = articles
            }.store(in: &cancelables)
    }
    
}
