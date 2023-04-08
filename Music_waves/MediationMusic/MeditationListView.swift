//
//  MeditationListView.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-08.
//

import SwiftUI

struct MeditationListView: View {
    
    private var mediationTraks : [MeditationStruct] = MeditationStruct.data
    
    var body: some View {
        VStack{
            
            List {
                ForEach(mediationTraks, id: \.track) { track in
                    
                    NavigationLink(destination: MeditationMusicScreen(meditationVM: MeditationViewModel(meditaiton: track))) {
                        
                        TrackRowView(track: track)
                        
                    }
                }
            }
            
        }
    }
}



struct TrackRowView: View {
    var track: MeditationStruct

    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Color("DarkMainColor")
            
            Text(track.title)
                .foregroundColor(.primary)
                .font(.headline)
            
            HStack(spacing: 3) {
                Label(track.track, systemImage: "music.note")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

struct MeditationListView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationListView()
    }
}
