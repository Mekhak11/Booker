//
//  AllBooksView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 30.03.23.
//

import SwiftUI

struct AllBooksView: View {
    @Binding var allBooks:[BookDetailsModel]
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @State var type: Int = 0
    
    var body: some View {
        VStack {
            ScrollView {
               // filter
                books
             
            }
        }
    }
}

extension AllBooksView {
    private var books: some View {
        LazyVGrid(columns: columns) {
            ForEach($allBooks) { $book in
                NavigationLink(destination: BookDetalisView<BookDetailsViewModel>(model: $book)) {
                    BookCellView(model: $book)
                }
                
            }
        }
    }
    private var filter: some View {
        Picker("", selection: $type) {
            Text("Rom")
                .tag(1)
            Text("Old")
                .tag(2)
            Text("Gold")
                .tag(3)
            Text("Dog")
                .tag(4)
        }.pickerStyle(.segmented)

    }
}

struct AllBooksView_Previews: PreviewProvider {
    static var previews: some View {
        AllBooksView(allBooks: .constant([]))
    }
}
