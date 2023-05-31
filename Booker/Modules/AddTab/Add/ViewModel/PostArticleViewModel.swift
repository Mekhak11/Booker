//
//  PostArticleViewModel.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import Foundation
import Combine

final class PostArticleViewModel: PostArticleViewModeling, Identifiable {
    @Published var isLoading: Bool = false
    @Published var error: RequestServiceError? = nil
    @Published var success: String? = nil
    
    private var postArticleuseCase: PostArticleUseCase
    private var cancelables = Set<AnyCancellable>()

    init(postArticleuseCase: PostArticleUseCase) {
        self.postArticleuseCase = postArticleuseCase
    }
    
    func postArticle(payload: ArticlePayload, complition: @escaping ()->()) {
        isLoading = true
        postArticleuseCase.execute(payload: payload)
            .sink { [weak self] result in
                DispatchQueue.main.async { [weak self] in
                    self?.isLoading = false
                }
                switch result {
                case .finished:
                    print("")
                case .failure(let error):
                    self?.error = error as? RequestServiceError
                    
                }
            } receiveValue: { [weak self]  tk in
              print(tk)
                complition()
                self?.success = "Your Story successfully posted!!!!"
                
            }.store(in: &cancelables)
    }
    
    
}
