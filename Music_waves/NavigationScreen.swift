//
//  NavigationScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-04.
//

import SwiftUI

struct NavigationScreen: View {
    
    let meditaitonVM = MeditationViewModel(meditaiton: MeditationStruct.data[3])
    
    var body: some View {
        VStack (spacing: 30) {
            MeditationMusicScreen(meditationVM: self.meditaitonVM)
//
//            NavigationLink(destination: MeditationMusicScreen()) {
//                Text("Meditation Music >")
//            }
//
//
//            NavigationLink(destination: MotivationVideoScreen()) {
//                Text("Motivational Video >")
//            }
//
//
//            NavigationLink(destination: LiveChatScreen()) {
//                Text("Live Chat >")
//            }

            
        }
    }
}

struct NavigationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationScreen()
    }
}
