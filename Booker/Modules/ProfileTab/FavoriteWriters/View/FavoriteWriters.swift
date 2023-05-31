//
//  FavoriteWriters.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 30.04.23.
//

import SwiftUI

struct FavoriteWriters<M: FavoriteWritersViewModeling>: View {
   
    @ObservedObject var viewModel:M = FavoriteWritersViewModel(getFavoriteWritersUseCase: GetFavoriteWritersUseCase(authRepository: AuthDefaultRepository()))
    as! M
    @State var isDetails = false
    var body: some View {
            content
            .onLoad {
                viewModel.getMyWriters()
            }
            .navigationTitle("Favorite Writers")

    }
}

extension FavoriteWriters {
    private var content: some View {
        VStack {
            ScrollView {
                ForEach($viewModel.writers, id: \.id){ $model in
                    NavigationLink(destination: WriterDetailsView<WriterDetailsViewModel>(model: $model)) {
//                        Button {
//                            isDetails.toggle()
//                        } label: {
                            WriterCell(model: $model) {
                                model.isLiked.toggle()
                            }
                        //}
                    }
                }
            }
        }.padding(16,0,16,0)
    }
}

struct FavoriteWriters_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteWriters<FavoriteWritersViewModel>()
    }
}
