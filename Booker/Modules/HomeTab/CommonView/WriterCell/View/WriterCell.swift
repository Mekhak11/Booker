//
//  WriterCell.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

struct WriterCell: View {
    
    @Binding var model: WriterDetailsModel
    var likeAction: ()->()
    
    private let imageSize: CGFloat = 100.0
    private let cornerRadius: CGFloat = 16.0
    private let padding: CGFloat = 12.0

    
     var likeunlikeUseCase: LikeUseCase = LikeUseCase(authRepository: AuthDefaultRepository())
    
    
    var body: some View {
            HStack {
                imageContent
                textContent
                Spacer()
                likeButton
            }
            .background(Color.AppColor.primaryBrawn)
            .cornerRadius(cornerRadius)
        //.background(.AppColor.primaryBrawn)
    }
}

extension WriterCell {
    private var imageContent: some View {
        ZStack {
            model.type.image
                .resizable()
                .frame(width: imageSize,height: imageSize)
                .padding(padding)
//            if $model.imageUrl != nil {
//                ImageView(withURL: model.imageUrl ?? "")
//                    .cornerRadius(cornerRadius)
//                    .frame(width: imageSize,height: imageSize)
//                    .padding(padding)
//            } else {
//                Image("author")
//                    .cornerRadius(cornerRadius)
//                    .frame(width: imageSize,height: imageSize)
//                    .padding(padding)
//            }
        }
    }
    
    private var textContent: some View {
        VStack(alignment: .leading, spacing: padding) {
            Text(model.firstName + " " +  model.lastName)
            Text(model.dateOfBirth)
            Text("Posts: \(model.postsNumber)")
        }.foregroundColor(.black)
    }
    private var likeButton: some View {
        VStack {
            Spacer()
            Button{
                if !model.isLiked {
                    likeunlikeUseCase.like(id: model.id)
                    
                }else {
                    likeunlikeUseCase.unLike(id: model.id)
                }
                model.isLiked.toggle()
            } label: {
                model.isLiked ? Image.Cell.liked : Image.Cell.notLiked
            }
            Spacer()
        }.padding(.trailing, 8)
    }
}

//struct WriterCell_Previews: PreviewProvider {
//    static var previews: some View {
//        WriterCell()
//    }
//}



