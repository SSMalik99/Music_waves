//
//  HomeScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-26.
//

import SwiftUI

struct HomeScreen: View {
    
    /**
     model
     viewmodel
     view
     
     */
    @EnvironmentObject var vm: UserStateViewModel
    
    var body: some View {
        
        if(vm.isBusy){
            ProgressView()
            
        }else{
            
            TabView {
                MeditationListView()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
             
                ProfileScreen()
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
             
             
            }
            .navigationTitle("Music Waves")
            .navigationBarTitleDisplayMode(.inline)
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
