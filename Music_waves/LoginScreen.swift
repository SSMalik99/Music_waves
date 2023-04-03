//
//  LoginScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-26.
//

import SwiftUI

struct LoginScreen: View {
    
    @EnvironmentObject var vm: UserStateViewModel
    @State var email = ""
    @State var password = ""
    
    fileprivate func EmailInput() -> some View {
        TextField("Email", text: $email)
            .keyboardType(.emailAddress)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .textFieldStyle(.roundedBorder)
    }
    
    fileprivate func PasswordInput() -> some View {
        SecureField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
    }
    
    fileprivate func LoginButton() -> some View {
        Button(action: {
            Task {
                await vm.signIn(
                    email: email,
                    password:password
                )
            }
        }) {
            Text("Login")
        }.padding(10).background(Color("DarkMainColor")).foregroundColor(.white).cornerRadius(8)
    }
    
    
    var body: some View {
        
        VStack{
            if(vm.isBusy){
                ProgressView()
            }else{
                
//                Text("Login Screen").font(.title)
                
                
                EmailInput().padding(.top,20).padding(.bottom, 20)
                PasswordInput().padding(.top,20).padding(.bottom, 20)
                
                if(vm.error != "" ){
                    Text(vm.error).foregroundColor(.red)
                }
                
                LoginButton().padding(.top,20).padding(.bottom, 20)
            }
        }
        
    }
}
