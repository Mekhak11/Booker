//
//  BookCellView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 28.03.23.
//

import SwiftUI

struct BookCellView: View {
    @Binding var model: BookDetailsModel
    var body: some View {
        ZStack(alignment: .center) {
            Image.BookCell.bookCell
            
            VStack{
                Text(model.title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                Text(model.author)
                    .font(.caption2)
                    .foregroundColor(.black)
            }
        }
    }
}

struct BookCellView_Previews: PreviewProvider {
    static var previews: some View {
        BookCellView(model: .constant(BookDetailsModel()))
    }
}
