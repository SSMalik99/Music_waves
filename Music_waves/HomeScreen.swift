//
//  HomeScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-26.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        
        if(vm.isBusy){
            ProgressView()
        }else{
            Text("Home Screen")
                .navigationTitle("Home")
                .toolbar {
                   
                        Button {
                            Task{
                                await vm.signOut()
                            }
                        } label: {
                            Image(systemName:  "rectangle.portrait.and.arrow.right")
                        }
             
                    
                }
        }
    }
}
