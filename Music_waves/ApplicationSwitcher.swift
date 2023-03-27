//
//  ApplicationSwitcher.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-26.
//

import SwiftUI



struct ApplicationSwitcher: View {
    @EnvironmentObject var vm: UserStateViewModel
        
        var body: some View {
            if (vm.isLoggedIn) {
                HomeScreen().environmentObject(vm)
            } else {
                LoginScreen()
            }
            
        }
}

struct ApplicationSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationSwitcher()
    }
}
