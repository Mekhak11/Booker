//
//  SignInView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 08.05.23.
//

import SwiftUI

struct SignInView<M: SignInViewModeling>: View {
    @ObservedObject var viewModel:M = SignInViewModel(signInUseCase: SignInUseCase(authRepository: AuthDefaultRepository())) as! M
    @EnvironmentObject var appState: AppState
    @State var isRegisterViewPresented: Bool = false
    var body: some View {
        content
    }
}

extension SignInView {
    private var content: some View {
        VStack(alignment: .leading) {
            title
            userNameAndPass
            Spacer()
            signInButton
        }.padding(16)
    }

    private var title: some View {
        Text("Sign In")
            .font(.title)
            .foregroundColor(Color.AppColor.darkBrown)
        
    }
    
    private var userNameAndPass: some View {
        VStack(spacing: 16) {
            CommonTextFieldLogin(
                placeholder: "Username",
                text: $viewModel.payload.username
            )
            CommonSecuredTextField(
                placeholder: "Password",
                text: $viewModel.payload.password
            )
            HStack {
                Spacer()
                registerButton
            }
        }
    }
    private var registerButton: some View {
        NavigationLink(destination:
                        RegistrationView<RegistrationViewModel>().environmentObject(appState),
                       isActive: $isRegisterViewPresented) {
            Button {
                isRegisterViewPresented = true
            } label: {
                Text("Don't hav an account? Register now.")
                    .foregroundColor(Color.AppColor.primaryBrawn)
                    .font(.callout)
            }
        }
    }
    private var signInButton: some View {
        CommonButton(
            action: {
                viewModel.signIn {
                    appState.contentState = .inApp
                }
            },
            title: "Sign In",
            isContentValid: $viewModel.isContentValid,
            isLoading: $viewModel.isLoading
        )
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView<SignInViewModel>()
    }
}
