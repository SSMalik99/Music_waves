//
//  NavigationScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-04.
//

import SwiftUI

struct NavigationScreen: View {
    var body: some View {
        VStack (spacing: 100) {
            
            NavigationLink(destination: MeditationMusicScreen()) {
                Text("Meditation Music >")
            }
            
            
            NavigationLink(destination: MotivationVideoScreen()) {
                Text("Motivational Video >")
            }
            
            
            NavigationLink(destination: LiveChatScreen()) {
                Text("Live Chat >")
            }

            
        }
    }
}

struct NavigationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationScreen()
    }
}
