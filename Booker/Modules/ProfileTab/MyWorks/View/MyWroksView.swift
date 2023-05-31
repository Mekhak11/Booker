//
//  MyWroksView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 30.04.23.
//

import SwiftUI

struct MyWroksView<M: MyArticlesViewModeling>: View {
    
    @ObservedObject var viewModel:M =
    MyArticlesViewModel(getMyArticlesUseCase: GetMyArticlesUseCase(authRepository: AuthDefaultRepository()))
    as! M
    @State var mytype: WriterType

    var body: some View {
        VStack {
            ScrollView {
                books
                    .padding(16,0,16,0)
            }
            addButton
                .padding(16)
        }.navigationTitle("My Books")
            .onLoad {
                viewModel.getMyArticles()
            }
    }
}

extension MyWroksView {
    private var books: some View {
        ForEach($viewModel.articles) { $book in
                NavigationLink(destination: BookDetalisView<BookDetailsViewModel>(model: $book)) {
                    MyWorkCell(model: book,type: mytype)
                }
            }
        
    }
    private var addButton: some View {
        CommonButton(title: "Add New Work")
    }
}

struct MyWroksView_Previews: PreviewProvider {
    static var previews: some View {
        MyWroksView<MyArticlesViewModel>(mytype: .abstract)
    }
}
