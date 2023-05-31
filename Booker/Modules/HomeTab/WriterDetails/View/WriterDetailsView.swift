//
//  WriterDetailsView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.04.23.
//

import SwiftUI

struct WriterDetailsView<M: WritersDetailsViewModeling>: View {
    @ObservedObject var viewModel:M = WriterDetailsViewModel(getWriterBooksUseCase: GetWriterBooksUseCase(authRepository: AuthDefaultRepository()))
    as! M
    
    @Binding var model: WriterDetailsModel
    @State var type: Int = 1
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView {
            VStack {
                header
                switch type {
                case 1:
                    books
                case 2:
                    about
                default:
                    about
                }
            }.padding(16)
        }.onLoad {
            viewModel.getBooks(by: model.id) {
                model.books = viewModel.books
            }
            
        }
    }
}

extension WriterDetailsView {
    private var header: some View {
        VStack(spacing: 45) {
            model.type.image
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            filter
        }
    }
    
    private var books: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach($model.books) { $book in
                    NavigationLink(destination: BookDetalisView<BookDetailsViewModel>(model: $book)) {
                        BookCellView(model: $book) 
                    }
                }
            }
            Button {
                print("More")
                    
            }label: {
                Text("See More")
                    .foregroundColor(Color.AppColor.primaryBrawn)
            }
        }
    }
    
    private var about: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("\(model.firstName) \(model.lastName)")
                .font(.title)
            Text("Biography: ")
            Text(model.biography)
                .font(.callout)
        }
    }
    
    private var filter: some View {
                Picker("", selection: $type) {
                    Text("Books")
                        .tag(1)
                    Text("About")
                        .tag(2)
                }.pickerStyle(.segmented)
    }
}

struct WriterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WriterDetailsView<WriterDetailsViewModel>(model: .constant(WriterDetailsModel()))
    }
}
