//
//  MeditationViewModel.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-07.
//

import Foundation

final class MeditationViewModel : ObservableObject {
    private(set) var meditation : Meditation
    init (meditaiton: Meditation) {
        self.meditation = meditaiton
    }
}

struct Meditation {
    let id  = UUID()
    let title : String
    let description : String
    let duration : TimeInterval
    let track : String
    let image : String
    
    static let data = Meditation(title: "1 minute relaxing Meditation", description: "Clear your Mind and slumber into nothingness. Allocate only a few moments for a quick breather", duration: 70, track: "meditation1", image: "image_med")
}
