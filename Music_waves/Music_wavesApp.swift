//
//  Music_wavesApp.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-17.
//

import SwiftUI

@main
struct Music_wavesApp: App {
    
    @StateObject var userStateViewModel = UserStateViewModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
            NavigationView{
                ApplicationSwitcher()
            }
            .environmentObject(userStateViewModel)
            .navigationViewStyle(.stack)
            
        }
    }
}
