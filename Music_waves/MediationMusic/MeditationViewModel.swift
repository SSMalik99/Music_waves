//
//  MeditationViewModel.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-07.
//

import Foundation
import SwiftUI

final class MeditationViewModel : ObservableObject {
    
    private(set) var meditation : MeditationStruct
    
    init (meditaiton: MeditationStruct) {
        self.meditation = meditaiton
    }
    
}


