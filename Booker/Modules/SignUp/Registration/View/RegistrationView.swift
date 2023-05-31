//
//  RegistrationView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 06.05.23.
//

import SwiftUI

struct RegistrationView<M: RegitrationViewModeling>: View {
    @ObservedObject var viewModel:M = RegistrationViewModel(registrationUSeCase: RegisterUseCase(authRepository: AuthDefaultRepository()))
    as! M
    @EnvironmentObject var appState: AppState
    var body: some View {
        ScrollView {
            content
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView<RegistrationViewModel>()
    }
}

extension RegistrationView {
    
    private var content: some View {
        VStack(alignment: .leading,spacing: 16) {
            title
            firstName
            lastName
            email
            description
            typePicker
            birthDay
            pass
            
            Spacer()
            registerButton
        }.padding(16)
    }
    private var pass: some View {
        VStack(spacing: 16) {
            password
            confirmPassword
        }
    }
    private var title: some View {
        Text("Regiter To Booker")
            .font(.title)
            .foregroundColor(Color.AppColor.darkBrown)
    }
    private var description: some View {
        TextEditor(text: $viewModel.payload.description)
            .border(Color.gray,width: 1)
            .frame(minHeight: 100)
            
    }
    
    private var firstName: some View {
        CommonTextFieldLogin(placeholder: "First Name", text: $viewModel.payload.firstname)
    }
    private var lastName: some View {
        CommonTextFieldLogin(placeholder: "Last Name", text: $viewModel.payload.lastname)
    }
    private var email: some View {
        CommonTextFieldLogin(placeholder: "Mail", text: $viewModel.payload.email)
    }
    private var mainGenre: some View {
        CommonTextFieldLogin(placeholder: "Genre", text: $viewModel.payload.mainGenre)
    }
    private var password: some View {
        CommonSecuredTextField(placeholder: "Password", text: $viewModel.payload.password)
    }
    private var confirmPassword: some View {
        CommonSecuredTextField(placeholder: "Confirm Pass", text: $viewModel.confirmPass)
    }
    
    private var typePicker: some View {
        Menu {
            Picker(selection: $viewModel.writerType) {
                ForEach(WriterType.allCases, id: \.self) { tp in
                    HStack {
                        Text(tp.rawValue)
                        tp.image
                    }
                    .tag(tp as WriterType?)
                }
            } label: {  }
        } label: { typePickerLabel }
    }
    
    private var typePickerLabel: some View {
        HStack {
            Text(viewModel.writerType?.rawValue ?? "Genre")
                .foregroundColor(viewModel.writerType != nil ? Color.black : Color.secondary)
                .font(.callout)
            Spacer()
            viewModel.writerType?.image
                .resizable()
                .scaledToFit()
                
        }
        .padding(16)
        .frame(
            height: 48
        )
        .background(Color.white)
        .border(Color.gray, width: 1)
    }
    
    private var birthDay: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 48)
                .background(Color.clear)
                .border(Color.gray, width: 1)
            DatePicker("Birthday", selection: $viewModel.dateOfBirth, displayedComponents: [.date])
                .padding(.horizontal,16)
                .foregroundColor(Color.gray)
        }
    }
    
    private var registerButton: some View {
        CommonButton(
            action: {
                viewModel.register {
                    appState.contentState = .inApp
                }
        },
            title: "Register",
            isContentValid: $viewModel.isContentValid,
            isLoading: $viewModel.isLoading
        
        )
    }
    
}
