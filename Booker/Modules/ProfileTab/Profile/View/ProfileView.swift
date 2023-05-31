//
//  ProfileView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

struct ProfileView<M: ProfileViewModeling>: View {
    @ObservedObject var viewModel:M = ProfileViewModel(getMeUseCase: GetMeUseCsae(authRepository: AuthDefaultRepository()))
    as! M
    var model: WriterModel = WriterModel(id: UUID(), name: "Mekhak", surname: "Ghapantsyan", dateOfBirth: Date(), imageUrl: nil, isLiked: false, postNumber: 10)
    
    @State var isSettingsPresented: Bool = false
    @State var isFavoritesPreented: Bool = false
    @State var isEditPresented: Bool = false
    @State var isMyBooksPresented: Bool = false
    @State var isFavoritArticlesPresntes: Bool = false
    
    @EnvironmentObject var appState: AppState
    var body: some View {
       content
            .onLoad {
                viewModel.getMe()
            }
            .navigationTitle("Profile")
    }
}

extension ProfileView {
//
    private enum ButtonNavigation {
        case edit, myBooks, favorites, settings,favArticles
        
        var title: String {
            switch self {
            case .edit:
                return "Edit Profile"
            case .myBooks:
                return "My Books"
            case .favorites:
                return "Favorite Writers"
            case .settings:
                return "Settings"
            case .favArticles:
                return "Favorite Books"
            }
        }
        
        var icon: Image {
            switch self {
            case .edit,.favorites:
                return Image("icon.edit")
            case .myBooks, .favArticles:
                return Image("icon.books")
            case .settings:
                return Image("icon.settings")
            }
        }
    }
    
    private var content: some View {
        if viewModel.isLoading {
           return AnyView( ZStack {
                ProgressView()
            }
                    )
                    
        }else {
           return  AnyView(
            ScrollView{
                VStack {
                    header
                    footerButtons
                    CommonButton(type: .secondary,color: .red, action: {
                        appState.contentState = .signIn
                        UserDefaultsService().setPrimitive(false, forKey: .User.isLoggedIn)
                        UserDefaultsService().remove(key: .User.token)
                    },
                    title: "Log Out")
                    Spacer()
                }.padding(16)
            }
            )
        }
    }
    
    private var header: some View {
            HStack {
          
                viewModel.user.type.image
                    .resizable()
                    .frame(width:100, height: 100)
                    .padding()
                Spacer()
                
                VStack {
                    Text(viewModel.user.firstName + " " + viewModel.user.lastName)
                    Text(viewModel.user.type.rawValue)
                }
                Spacer()
            }.background(Color.AppColor.primaryBrawn)
            .cornerRadius(16)
        
    }
    
    private var footerButtons: some View {
        VStack {
//            Button {
//                isEditPresented.toggle()
//            } label: {
//                navButton(.edit)
//            }
            NavigationLink(destination: MyWroksView<MyArticlesViewModel>(mytype: viewModel.user.type),isActive: $isMyBooksPresented){
                Button {
                    isMyBooksPresented.toggle()
                } label: {
                    navButton(.myBooks)
                }
            }
            NavigationLink(destination: FavoriteWriters<FavoriteWritersViewModel>(),isActive: $isFavoritesPreented) {
                Button {
                    isFavoritesPreented.toggle()
                } label: {
                    navButton(.favorites)
                }
            }
            NavigationLink(destination: FavoriteArticlesView<FavoriteArticlesViewModel>(),isActive: $isFavoritArticlesPresntes) {
                Button {
                    isFavoritArticlesPresntes.toggle()
                } label: {
                    navButton(.favArticles)
                }
            }
            Button {
                isSettingsPresented.toggle()
            } label: {
                navButton(.settings)
            }
            
        }
    }
    
    private func navButton(_ type: ButtonNavigation)-> some View {
        HStack {
            type.icon
                .padding(16)
            Text(type.title)
                .foregroundColor(.black)
            Spacer()
        }.background(Color.AppColor.primaryBrawn)
        .cornerRadius(30)
        
        
      }
    
    private var logout: some View {
        Button {
            appState.contentState = .signIn
            UserDefaultsService().setPrimitive(false, forKey: .User.isLoggedIn)
        } label: {
            Text("Log out")
                .foregroundColor(.red)
        }
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView<ProfileViewModel>()
    }
}
