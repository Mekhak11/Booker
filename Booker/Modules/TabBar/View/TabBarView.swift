//
//  TabBarView.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI
import UIKit

struct TabBarView: View {
        
    @State var activeTab: TabItem = .home
    
    @State var isNewPost = false
    
    
    var body: some View {
        tabView
            .onAppear {
                configureTabbar()
            }
    }
}

extension TabBarView {
    private var tabView: some View {
        TabView(selection: $activeTab) {
            homeTab
                .tabItem { TabViewTab(activeTab: $activeTab, tab: .home) }
                .tag(TabItem.home)
            
            addTab
                .tabItem { TabViewTab(activeTab: $activeTab, tab: .add) }
                .tag(TabItem.add)
            
            profileTab
                .tabItem { TabViewTab(activeTab: $activeTab, tab: .profile) }
                .tag(TabItem.profile)
        }.fullScreenCover(isPresented: $isNewPost) {
            NavigationView {
                ProfileView<ProfileViewModel>()
            }.navigationViewStyle(.stack)
        }
    }
    
    private var homeTab: some View {
        NavigationView {
            HomeView<HomeViewModel>()
        }.navigationViewStyle(.stack)
    }
    private var addTab: some View {
        NavigationView {
            AddView<PostArticleViewModel>()
        }.navigationViewStyle(.stack)
    }
    private var profileTab: some View {
        NavigationView {
            ProfileView<ProfileViewModel>()
        }.navigationViewStyle(.stack)
    }
    
    private func configureTabbar() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabBarAppearance
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }

}
