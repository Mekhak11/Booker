//
//  OnboardingView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 09.05.23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var selection = 0
    @State var isSignUpView = false
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                OnboardingSlideView(image: "onboarding1", title: "Welcome", description: "Welcome to our app, where you can immerse yourself in a vast collection of books and unleash your writing talents. Our app is designed to provide you with an immersive reading experience and to inspire you to write your own stories.", buttonTitle: "Next", tag: 0)
                    .tag(0)
                
                OnboardingSlideView(image: "onboarding2", title: "Get Started", description: "Are you passionate about literature and writing? Look no further than our app! Our app provides you with access to an extensive collection of books, as well as a supportive community of writers.", buttonTitle: "Next", tag: 1)
                    .tag(1)
                
                OnboardingSlideView(image: "onboarding3", title: "Enjoy!", description: "Welcome to our app, where you can ignite your passion for books and writing. Our app offers a wide range of features that are tailored to your interests, whether you're an avid reader or a budding writer.", buttonTitle: "Start", tag: 2)
                    .tag(2)
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
        
                CommonButton(
                    action: {
                        if selection != 2 {
                            withAnimation {
                                selection += 1
                            }
                        } else {
                            appState.contentState = .signIn
                        }
                    },
                    title: "Next")
                .padding(16)
        }
    }
}

struct OnboardingSlideView: View {
    var image: String
    var title: String
    var description: String
    var buttonTitle: String
    var tag: Int
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }.frame(width: 250,height: 250)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            Text(description)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
//            Button(action: {
//                // Handle button tap here
//            }, label: {
//                Text(buttonTitle)
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding(.vertical, 10)
//                    .padding(.horizontal, 50)
//                    .background(Color.blue)
//                    .cornerRadius(30)
//            })
//            .padding(.bottom, 30)
        }
        .tag(tag)
    }
}
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
