//
//  FavoriteArticlesViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation

import Foundation
import Combine

final class FavoriteArticlesViewModel: FavoriteArticlesViewModeling, Identifiable {

    

    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var articles: [BookDetailsModel] = []
    
    private var cancelables = Set<AnyCancellable>()
    private var getFavoriteArticlesuseCase: GetFavoriteArticlesuseCase
    
    init(getFavoriteArticlesuseCase: GetFavoriteArticlesuseCase) {
        self.getFavoriteArticlesuseCase = getFavoriteArticlesuseCase
    }
    
    func getMyArticles() {
        isLoading = true
        getFavoriteArticlesuseCase.execute()
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
