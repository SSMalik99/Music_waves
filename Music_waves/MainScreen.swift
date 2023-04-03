//
//  MainScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-01.
//

import SwiftUI

struct MainScreen: View {
    @State var userRequest = "Login"
    
    var body: some View {
        VStack{
            VStack{
                
//                Horizonatal naviogation
                HStack(spacing: 125) {
                    
                    Button(action: {
                        self.userRequest = "Login"
                    }, label: {
                        Text("Login").padding(10)
                        
                    }).background(Color("DarkMainColor"))
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .cornerRadius(20)
                    
                    Button(action: {
                        self.userRequest = "Register"
                    }, label: {
                        Text("Register").padding(10)
                    }).background(Color("DarkMainColor"))
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .cornerRadius(20)
                    
                }.padding(.bottom, 50)
                    .padding(.top, 30)
                    
                
                
                
                
                if userRequest == "Register" {
                    
                    RegisterScreen().padding(20)
                    
                }else {
                    LoginScreen().padding(20)
                }
            }.background(Color("LightMainColor"))
                .border(Color("LightMainColor"), width: 5)
                .cornerRadius(20)
                
            
        }.padding(25)
            .navigationTitle("Music Waves")
            
//        UINavigationBar.appearance().barTintColor = UIColor(Color("DarkMainColor"))
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
