//
//  AudioManager.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-07.
//

import Foundation
import AVKit

final class AudioManager : ObservableObject {
    
    //MARK: Make it singlton
//    static let shared = AudioManager()
    
    var player  : AVAudioPlayer?
    @Published private(set) var isPlaying : Bool = false {
        didSet {
            print("isPlaying", isPlaying)
        }
    }
    
    func startPlayer (track : String ) {
        guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found: \(track)")
            return
        }
        do  {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            isPlaying = true
        } catch {
            print("fail to initialize player", error)
        }
    }
    
    func playPause () {
        guard let player = player else {
            print("instance of audio player not found")
            return
        }
        
        if player.isPlaying {
            player.pause()
            isPlaying = false
        }else {
            player.play()
            isPlaying = true
        }
    }
    
    func stop() {
        guard let player = player else {
            print("instance of audio player not found")
            return
        }
        if player.isPlaying {
            isPlaying = false
        }
    }
}
