//
//  TabViewTab.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

struct TabViewTab: View {
    
    @Binding var activeTab: TabItem
    var tab: TabItem
    
    var body: some View {
        activeTab == tab ? tab.selectedImage : tab.unselectedImage
           
    }
}


// MARK: - Preview

struct TabViewTab_Previews: PreviewProvider {
    @State static var activeTab: TabItem = .home
    
    static var previews: some View {
        TabViewTab(activeTab: $activeTab, tab: .home)
    }
}
