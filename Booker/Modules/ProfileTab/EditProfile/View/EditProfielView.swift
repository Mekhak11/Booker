//
//  EditProfielView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 01.05.23.
//

import SwiftUI

struct EditProfielView: View {
    @Binding var model: WriterDetailsModel
    @State var group = ["Male","Feamle","Optional"]
    @State var types = ["Romantic", "Realistic","Lyricist", "Free-type"]
    var body: some View {
       content
    }
}

extension EditProfielView {
    
    private var content: some View {
        VStack {
            firstName
            lastName
            email
            HStack {
                writerType
                Spacer()
                gender
            }
        }.padding(16)
    }
    
    private var firstName: some View {
        CommonTextFieldLogin(placeholder: "First Name", text: $model.firstName)
    }
    
    private var lastName: some View {
        CommonTextFieldLogin(placeholder: "Last Name", text: $model.lastName)
    }
    private var email: some View {
        CommonTextFieldLogin(placeholder: "Email", text: $model.email)
    }
    private var writerType: some View {
        ZStack {
            Menu {
                Picker("", selection: $model.type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
            } label: {
                HStack {
                    Text(model.type.rawValue)
                    
                }
            }
        }.background(.white)
    }

  
    private var gender: some View {
        ZStack {
            Picker("", selection: $model.gender) {
                ForEach(group, id: \.self) {
                    Text($0)
                }
            }
            .labelsHidden()
            .pickerStyle(.segmented)
        }.background(.white)
    }
    
}

struct EditProfielView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfielView(model: .constant(WriterDetailsModel()))
    }
}
