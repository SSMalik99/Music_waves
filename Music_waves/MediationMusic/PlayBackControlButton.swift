//
//  PlayBackControlButton.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-07.
//

import SwiftUI

struct PlayBackControlButton: View {
    var systemName : String = "play"
    var fontSize : CFloat = 24
    var color : Color = .white
    var action : () -> Void
    
    
    var body: some View {
        Button{
            action()
        }label: {
            Image(systemName: systemName)
                .font(.system(size: CGFloat(self.fontSize)))
                .foregroundColor(color)
        }
    }
}

struct PlayBackControlButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayBackControlButton(action: {})
            .preferredColorScheme(.dark)
    }
}
