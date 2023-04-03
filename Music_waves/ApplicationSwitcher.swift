//
//  ApplicationSwitcher.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-26.
//

import SwiftUI



struct ApplicationSwitcher: View {
//    @State var launchTimeAdded : Float  = 0
    
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @EnvironmentObject var vm: UserStateViewModel
        
        var body: some View {
            
            
                
                if (vm.isLoggedIn || vm.userToken != "N/A") {
                    // if user is logged in
                    HomeScreen().environmentObject(vm)
                } else {

                    // if user is not logged in
                    MainScreen()
                }
        }
}

struct ApplicationSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationSwitcher()
    }
}
