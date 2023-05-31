//
//  HomeView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

struct HomeView<M: HomeViewModeling>: View {
    
    @ObservedObject var viewModel:M = HomeViewModel(getWritersUSeCase: GetWritersUseCase(authRepository: AuthDefaultRepository()), getBooksUseCase: GetAllBooksUseCase(authRepository: AuthDefaultRepository()))
    as! M
    @State var isAllWriters: Bool = false
    @State var isAllBooks: Bool = false
    @State var isWriterDetails: Bool = false
    
    @State var chosenModel: WriterDetailsModel = WriterDetailsModel()
    
    
    var body: some View {
        ScrollView {
            PullToRefresh(coordinateSpaceName: "pullToRefresh") {
                viewModel.getBooks()
                viewModel.getWriters()
                }
        VStack(spacing: 25) {
                slider
                writersView
                booksView
        }
        }.padding(16)
            .onLoad{
                viewModel.getWriters()
                viewModel.getBooks()
            }.coordinateSpace(name: "pullToRefresh")
      }
    }


extension HomeView {
    private var slider: some View {
        ZStack {
            Image("slider")
        }
    }
    
    private var writersView: some View {
        VStack {
            NavigationLink(destination: NavigationLazyView(AllWritersView(allWriters: viewModel.writers)), isActive: $isAllWriters) {
                seeAll(title: "Top Writers") {
                    isAllWriters = true
                }
            }
            VStack(spacing: 16) {
                ForEach(Array($viewModel.writers.enumerated()), id: \.offset) { index, $writer in
                    if index < 3 {
                        NavigationLink(destination: WriterDetailsView<WriterDetailsViewModel>(model: $chosenModel), isActive: $isWriterDetails) {
                            Button {
                                isWriterDetails = true
                                chosenModel = $writer.wrappedValue
                            } label: {
                                
                                WriterCell(model: $writer) {
                                    writer.isLiked.toggle()
                                }
                            }
                        }
                    }
                }
            }.padding(16)
        }
    }
    
    private var booksView: some View {
        VStack {
            NavigationLink( destination: NavigationLazyView(AllBooksView(allBooks: $viewModel.books)), isActive: $isAllBooks) {
                seeAll(title: "Top books") {
                    isAllBooks = true
                    
                }
            }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach($viewModel.books, id: \.id) { $book in
                            NavigationLink(destination: NavigationLazyView(BookDetalisView<BookDetailsViewModel>(model: $book))){
                                BookCellView(model: $book)
                                    
                            }
                            
                        }
                    }
                }.padding(.leading, 16)
        }
    }
    
    private func seeAll(title: String, complition: @escaping ()->()) -> some View {
        return HStack {
            Text(title)
                .font(Font.custom("KoHo-ExtraLight", size: 12 ).weight(.regular))
                .foregroundColor(.AppColor.primaryBrawn)
            Spacer()
            Button {
                complition()
            } label: {
                 Text("See all")
                    .font(AppFont.Koho.Small.regular)
                    .foregroundColor(.AppColor.primaryBrawn)
            }
        }.padding()
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView<HomeViewModel>()
    }
}
