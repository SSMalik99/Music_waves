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
    @StateObject var audioManger = AudioManager()
    
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView{
                ApplicationSwitcher()
            }
            .environmentObject(userStateViewModel)
            .environmentObject(audioManger)
            .navigationViewStyle(.stack)
            
            
        }
    }
}
