//
//  SearchView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 10.05.23.
//

import SwiftUI

struct SearchView<M: SearcgViewModeling>: View {
    @ObservedObject var viewModel:M = SearcgViewModel(searchUseCase: SearchUseCase(authRepository: AuthDefaultRepository()))
    as! M
    @State var searchText: String = ""
    var body: some View {
        ScrollView {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach($viewModel.result.books, id: \.id) { $book in
                            NavigationLink(destination: NavigationLazyView(BookDetalisView<BookDetailsViewModel>(model: $book))){
                                BookCellView(model: $book)
                                
                            }
                            
                        }
                    }
                }.padding(.leading, 16)
                VStack(spacing: 16) {
                    ForEach($viewModel.result.writers, id: \.id) { $writer in
                        NavigationLink(destination: WriterDetailsView<WriterDetailsViewModel>(model: $writer)) {
                            WriterCell(model: $writer) {
                                writer.isLiked.toggle()
                            }
                        }
                    }
                    
                }.padding(16)
            }
            
            
        }.padding()
//            .navigationBarItems(trailing: CommonTextFieldLogin(placeholder: "Search...", text: $searchText))
            .toolbar { ToolbarItem(placement: .principal) { TextField("Search...", text: $searchText)
                    .frame(height: 30)
            } }
            .onChange(of: searchText) { newValue in
                viewModel.search(searchWord: newValue)
            }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView<SearcgViewModel>()
    }
}
