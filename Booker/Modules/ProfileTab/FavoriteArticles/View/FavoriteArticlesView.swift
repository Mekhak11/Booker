//
//  FavoriteArticles.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import SwiftUI

struct FavoriteArticlesView<M: FavoriteArticlesViewModel>: View {
    
    @ObservedObject var viewModel:M =
    FavoriteArticlesViewModel(getFavoriteArticlesuseCase: GetFavoriteArticlesuseCase(authRepository: AuthDefaultRepository()))
    as! M
    var body: some View {
        ScrollView {
            books
                .padding()
        }.onLoad {
            viewModel.getMyArticles()
        }
        .navigationTitle("Favorite Books")
    }
}



struct FavoriteArticlesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteArticlesView<FavoriteArticlesViewModel>()
    }
}

extension FavoriteArticlesView {
    private var books: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]) {
            ForEach($viewModel.articles) { $book in
                NavigationLink(destination: BookDetalisView<BookDetailsViewModel>(model: $book)) {
                    BookCellView(model: $book)
                }
                
            }
        }
    }
}
