//
//  ContentView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State private var state: ContentState = .signIn

    var body: some View {
        Group {
        switch state {
        case .signIn:
            NavigationView {
              //  OnboardingView()
                SignInView<SignInViewModel>()
                    .environmentObject(appState)
            }
        case .inApp:
            TabBarView(activeTab: .home)
        case .onboarding:
            NavigationView {
//                SignInView<SignInViewModel>()
                OnboardingView()
                    .environmentObject(appState)
            }
        }
    } .onReceive(appState.$contentState) {
        state = $0
    }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
