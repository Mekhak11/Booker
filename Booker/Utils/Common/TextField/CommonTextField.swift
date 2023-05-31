//
//  CommonTextFieldLogin.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 22.03.23.
//

import SwiftUI

struct CommonTextFieldLogin: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(LocalizedStringKey(placeholder), text: $text)
            .padding()
            .frame(height: 48)
            .background(.white)
            .overlay (
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}

struct CommonSecuredTextField: View {
    var placeholder: String
    @Binding var text: String
    @State private var isSecure: Bool = true
    
    var body: some View {
        HStack {
            if isSecure {
                SecureField(LocalizedStringKey(placeholder), text: $text)
                    .padding()
                    .frame(height: 48)
                    .background(Color.white)
            } else {
                TextField(LocalizedStringKey(placeholder), text: $text)
                    .padding()
                    .frame(height: 48)
                    .background(Color.white)
            }
            eyeButton
                .padding()
            
        } .overlay (
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
    var eyeButton: some View {
        Button {
            isSecure.toggle()
        } label: {
            //isSecure ? Image.TextField.openEye : Image.TextField.closedEye
        }
    }
}
