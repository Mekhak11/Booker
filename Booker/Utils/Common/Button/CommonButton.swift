//
//  CommonButton.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 01.05.23.
//

import SwiftUI

struct CommonButton: View {
    var type: `Type` = .primary
    var color: Color = .white
    var backgroundColor: Color? = nil
    var action: (() -> Void)? = nil
    let title: String
    @Binding var isContentValid: Bool
    @Binding var isLoading: Bool
    
    init(type: `Type` = .primary, color: Color = .white, backgroundColor: Color? = nil, action: (() -> Void)? = nil, title: String, isContentValid: Binding<Bool> = .constant(true), isLoading: Binding<Bool> = .constant(false)) {
        self.type = type
        self.color = color
        self.backgroundColor = backgroundColor
        self.action = action
        self.title = title
        self._isContentValid = isContentValid
        self._isLoading = isLoading
    }
    var body: some View {
        ZStack {
            switch type {
            case .primary:
                if isContentValid {
                    Color.AppColor.darkBrown
                } else {
                    Color.gray
                }
            case .secondary:
                Color.white
            }
            
            if let action = action {
                Button(action: action, label: {
                    ZStack {
                        switch type {
                        case .primary:
                            isContentValid ? Color.AppColor.darkBrown : .gray
                        case .secondary:
                            Color.clear
                                .border(color)
                        }
                        label
                    }
                }).disabled(!isContentValid)
            } else {
                label
            }
        }.frame(height: 44)
            .cornerRadius(16)
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(color, lineWidth: 1))
    }
    
    private var label: some View {
        ZStack {
            if isLoading {
                    ProgressView()
            }else {
                    Text(LocalizedStringKey(title))
                        .font(.title2)
                        .foregroundColor(color)
            }
        }
    }
}
extension CommonButton {
    enum `Type` {
        case primary, secondary
    }
}

//struct CommonButtonLogin_Previews: PreviewProvider {
//    static var previews: some View {
//        CommonButtonLogin()
//    }
//}

