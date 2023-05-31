//
//  AddView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

struct AddView<M: PostArticleViewModeling>: View {
    @ObservedObject var viewModel:M = PostArticleViewModel(postArticleuseCase: PostArticleUseCase(authRepository: AuthDefaultRepository()))
    as! M
    @State var text: String = ""
    @State var title: String = ""
    var body: some View {
            VStack(spacing: 32) {
                
                CommonTextFieldLogin(placeholder: "Title", text: $title)
                    .padding(.top,32)
                
                TextEditor(text: $text)
                    .font(.callout)
                    .foregroundColor(Color.AppColor.primaryBrawn)
                    .border(Color.gray,width: 2)
                    .frame(height: 350)
               
                saveButton
                Spacer()
                
            }
        .padding()
            .alert(isPresented: .constant(viewModel.error != nil)) {
                Alert(
                    title: Text("Error"),
                    message: Text(viewModel.error?.message ?? ""),
                    dismissButton: .destructive(Text("Close"), action: {
                        viewModel.error = nil
                    })
                )
            }
            .alert(isPresented: .constant(viewModel.success != nil)) {
                Alert(
                    title: Text("Success"),
                    message: Text(viewModel.success ?? ""),
                    dismissButton: .default(Text("Done").foregroundColor(.green), action: {
                        viewModel.success = nil
                    })
                )
            }
    }
}

extension AddView {
    private var saveButton: some View {
        CommonButton(
            action: {
                viewModel.postArticle(payload: ArticlePayload(title: title, text: text)) {
                    text = ""
                    title = ""
                }
        },
            title: "Save",isLoading: $viewModel.isLoading)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView<PostArticleViewModel>()
    }
}
