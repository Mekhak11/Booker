//
//  AllWritersView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 30.03.23.
//

import SwiftUI

struct AllWritersView: View {
    @State var allWriters: [WriterDetailsModel]
    @State var toShow: [WriterDetailsModel] = []
    @State var chosenModel: WriterDetailsModel = WriterDetailsModel()
    @State var isSearchView = false
    @State var type: WriterType? = nil {
        didSet {
            switch type {
            case .abstract:
                toShow = allWriters.filter({$0.type == .abstract})
            case .fantastic:
                toShow = allWriters.filter({$0.type == .fantastic})
            case .realistic:
                toShow = allWriters.filter({$0.type == .realistic})
            case .romantic:
                toShow = allWriters.filter({$0.type == .romantic})
            default:
                toShow = allWriters
            }
        }
    }
    @State var isWridterDetails = false
    
    var body: some View {
        VStack(spacing: 35) {
           // typePicker
            allwritersList
            
        }.padding(16)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    searchButton
                }
            }


    }
}

extension AllWritersView {
    private var allwritersList: some View {
        VStack {
            ScrollView {
                ForEach($allWriters, id: \.id){ $model in
                    NavigationLink(destination: WriterDetailsView<WriterDetailsViewModel>(model: $chosenModel), isActive: $isWridterDetails) {
                        Button {
                            chosenModel = $model.wrappedValue
                            isWridterDetails.toggle()
                        } label: {
                            WriterCell(model: $model) {
                                model.isLiked.toggle()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private var filter: some View {
            Picker("", selection: $type) {
                ForEach(WriterType.allCases,id: \.rawValue) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }.pickerStyle(.segmented)
        }
    private var typePicker: some View {
        Menu {
            Picker(selection: $type) {
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
            Text("Genre")
                .foregroundColor(type != nil ? Color.black : Color.secondary)
                .font(.callout)
            Spacer()
            type?.image
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
    
    private var searchButton: some View {
        NavigationLink(destination: SearchView<SearcgViewModel>(),isActive: $isSearchView) {
            Button{
                isSearchView = true
            } label: {
                Image(systemName: "magnifyingglass")
            }
        }
    }
}

struct AllWritersView_Previews: PreviewProvider {
    static var previews: some View {
        AllWritersView(allWriters: [])
    }
}
