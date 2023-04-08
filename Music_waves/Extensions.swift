//
//  Extensions.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-07.
//

import Foundation

extension DateComponentsFormatter {
    
    // lazy intializatioin
    static let abbreviated : DateComponentsFormatter = {
        print("Initializing the date formatter abbrevation")
        let formetter = DateComponentsFormatter()
        
        formetter.allowedUnits = [.minute, .second]
        formetter.unitsStyle = .abbreviated
        
        return formetter
    }()
    
    static let positional : DateComponentsFormatter = {
        print("Initializing the date formatter positional")
        let formetter = DateComponentsFormatter()
        
        formetter.allowedUnits = [.minute, .second]
        formetter.unitsStyle = .positional
        formetter.zeroFormattingBehavior = .pad
        
        return formetter
    }()
}
