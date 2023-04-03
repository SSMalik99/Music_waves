//
//  Music_wavesApp.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-17.
//

import SwiftUI

import FirebaseFirestore
import FirebaseAuth
import Firebase

@main
struct Music_wavesApp: App {
    init() {
        FirebaseApp.configure()
        
    }
    
    @StateObject var userStateViewModel = UserStateViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
                ApplicationSwitcher()
            }
            .environmentObject(userStateViewModel)
            .navigationViewStyle(.stack)
            
            
        }
    }
}
