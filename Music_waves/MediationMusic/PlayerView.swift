//
//  PlayerView.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-07.
//

import SwiftUI

struct PlayerView: View {
    
    var meditationVM : MeditationViewModel
    
    @EnvironmentObject  var audioManger : AudioManager
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @State private var value : Double = 0.0
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isEditing : Bool = false
    
    var body: some View {
        ZStack{
            // MARK: Bakcground Image
            Image(meditationVM.meditation.image)
                .resizable()
                .scaledToFill()
                .frame(width:UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            
            VStack(spacing:32){
                //MARK: Dismiss Button
                HStack {
                    Button{
                        audioManger.stop()
                        dismiss()
                        }label:{
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 36))
                                .foregroundColor(.white)
                    }
                    Spacer()
                }
                //MARK: Title
                Text(meditationVM.meditation.title)
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                if let player = audioManger.player {
                // MARK: playback
                VStack(spacing: 5) {
                    // MARK: playback timeline
                    Slider(value: $value, in: 0...player.duration ){ editing in
                        
                        print("editing: \(editing)")
                        
                        isEditing = editing
                        if !editing {
                            player.currentTime = value
                        }
                        
                    }
                        .accentColor(.white)
                    
                    // MARK: playback time
                    
                    HStack{
                        Text(DateComponentsFormatter.positional.string(from: player.currentTime) ?? "0:00")
                        Spacer()
                        Text(DateComponentsFormatter.positional.string(from: player.duration - player.currentTime) ?? "0:00")
                    }.foregroundColor(.white)
                    
                }
                
                //MARK: playback control
                
                HStack{
                    
                    //MARK: Repeat Button
                    PlayBackControlButton(systemName:"repeat"){}
                    
                    Spacer()
                    
                    //MARK: Backword Button
                    PlayBackControlButton(systemName:"gobackward.10"){}
                    
                    Spacer()
                    
                    //MARK: play button
                    PlayBackControlButton(systemName: audioManger.isPlaying ? "pause.circle.fill" : "play.circle.fill", fontSize: 44){
                        audioManger.playPause()
                    }
                    
                    Spacer()
                    
                    //MARK: forwar button
                    PlayBackControlButton(systemName:"goforward.10"){}
                    
                    Spacer()
                    
                    //MARK: forwar button
                    PlayBackControlButton(systemName:"stop.fill"){
                        audioManger.stop()
                        dismiss()
                    }
                }
                }
            }
            .padding(20)
        } // z stack end
        .onAppear{
//            AudioManager.shared.startPlayer(track: meditationVM.meditation.track)
            self.audioManger.startPlayer(track: meditationVM.meditation.track)
        }
        .onReceive(timer) { _ in
            guard let player = audioManger.player, !isEditing else {
                 return
            }
            
            value = player.currentTime
            
        }
     }
}

struct PlayerView_Previews: PreviewProvider {
    
    static let meditaitonVM = MeditationViewModel(meditaiton: Meditation.data)
    static var previews: some View {
        PlayerView(meditationVM: meditaitonVM).environmentObject(AudioManager())
    }
}
