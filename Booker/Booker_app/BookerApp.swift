//
//  BookerApp.swift
//  Booker
//
//  Created by MEKHAK GHAPANTSYAN on 12.03.23.
//

import SwiftUI

@main
struct BookerApp: App {
    let appstate = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appstate)
        }
    }
}
