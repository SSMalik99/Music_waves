//
//  MeditationMusicScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-04.
//

import SwiftUI

struct MeditationMusicScreen: View {
    @StateObject var meditationVM : MeditationViewModel
    
    @State private var showPlayer = false
    
    var body: some View {
        
        VStack(spacing : 0) {
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .center)
              
            
            //MARK: Music Detail
            ZStack{
                //MARK: Background
                Color(red: 24/255, green: 23/255, blue: 22/255)
                
                VStack(alignment: .leading, spacing: 24) {
                    VStack(alignment: .leading, spacing: 24) {
                        //MARK: Type and duration
                        Text("Music")
                        Text( DateComponentsFormatter.abbreviated.string(from: meditationVM.meditation.duration) ?? meditationVM.meditation.duration.formatted() + "S")
                    }
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)
                    
                    // mark title
                    Text(meditationVM.meditation.title).font(.title)
                    
                    //MARK: play button
                    Button {
                        
                        showPlayer = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .frame(maxWidth:.infinity)
                            .background(.white)
                            .cornerRadius(20)
                    }
                    
                    
                    //MARK: description
                    Text(meditationVM.meditation.description).font(.body)
                    Spacer()
                }.foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3, alignment: .center)
        }.navigationBarHidden(true)
            .fullScreenCover(isPresented: $showPlayer) {
                PlayerView(meditationVM: self.meditationVM)
            }
    }
}

struct MeditationMusicScreen_Previews: PreviewProvider {
    
    static let meditaitonVM = MeditationViewModel(meditaiton: Meditation.data)
    
    static var previews: some View {
        MeditationMusicScreen(meditationVM: meditaitonVM).environmentObject(AudioManager())
    }
}
