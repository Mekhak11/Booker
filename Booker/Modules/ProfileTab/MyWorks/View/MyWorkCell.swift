//
//  MyWorkCell.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 01.05.23.
//

import SwiftUI

struct MyWorkCell: View {
    var model: BookDetailsModel
    var type: WriterType
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image.BookCell.shadowUnder
            Image.BookCell.shadowUpper
            HStack {
                VStack {
               
                    type.image
                        .resizable()
                        .clipped()
                        .frame(width: 60,height: 60)
                      //  .aspectRatio(2, contentMode: .fit)
                    Text(model.author)
                        .font(.callout)
                        .foregroundColor(.gray)
                    Text(model.title)
                        .font(.title)
                        .foregroundColor(.primary)
                }.padding()
                Spacer()
                VStack {
                    Image.Cell.liked
                    Text("\(model.likeCount)")
                        .foregroundColor(.gray)
                    
                }.padding()
            }.background(Color.AppColor.primaryBrawn)
                .cornerRadius(16)
                .onAppear {
                    
                }
        }
    }
}

struct MyWorkCell_Previews: PreviewProvider {
    static var previews: some View {
        MyWorkCell(model:BookDetailsModel(id: 0, title: "vardananq", author: "Mekhak", published: Date(), details: ""), type: .abstract)
    }
}
