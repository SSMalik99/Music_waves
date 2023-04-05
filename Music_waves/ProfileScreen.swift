//
//  ProfileScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-04.
//

import SwiftUI

struct ProfileScreen: View {
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        
        Text("\(vm.UserDetail["email"])" as String)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
