//
//  BookDetalisView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.04.23.
//

import SwiftUI

struct BookDetalisView<M: BookDetailsViewModeling>: View {
    @ObservedObject var viewModel:M = BookDetailsViewModel(likeUnlikeUseCase: ArticleLikeUnlikeUseCase(authRepository: AuthDefaultRepository())) as! M
    @Binding var model: BookDetailsModel
    var body: some View {
        ScrollView {
            VStack {
                header
                work
            }.padding(16)
        }
    }
}


extension BookDetalisView {
    private var header: some View {
        HStack {
            ZStack {
                Image("book.cover")
                    .cornerRadius(16)
                likeButton
            }
            title
            
        }
    }
    private var work: some View {
        Text(model.details)
            .multilineTextAlignment(.leading)
            .font(.callout)
            .foregroundColor(.black)
    }
    
    private var title: some View {
        VStack(spacing: 25) {
            Text("Title: \(model.title)")
                .font(.title)
            Text("Author: \(model.author)")
            Text("Likes: \(model.likeCount)")
            
        }
    }
    
    private var likeButton: some View {
        Button {
            if model.isLiked {
                viewModel.unlikeArticle(id: model.id) {
                    model.isLiked.toggle()
                    model.likeCount -= 1
                }
            } else {
                viewModel.likeArticle(id: model.id) {
                    model.isLiked.toggle()
                    model.likeCount += 1
                }
            }
        } label: {
                if model.isLiked {
                    Image.Cell.liked
                        .resizable()
                        .frame(width: 48,height: 48)
                } else {
                    Image.Cell.notLiked
                        .resizable()
                        .frame(width: 48,height: 48)
                }
                
            
        }
    }
}

struct BookDetalisView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetalisView<BookDetailsViewModel>(model: .constant(BookDetailsModel()))
    }
}
