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
            
            
            if (vm.isLoggedIn || vm.userToken != "N/A") {
                HomeScreen().environmentObject(vm)
            } else {
//                LoginScreen()
                MainScreen()
            }
            
        }
}

struct ApplicationSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationSwitcher()
    }
}
