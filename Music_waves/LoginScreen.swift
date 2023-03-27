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
            Text("Sign In")
        }
    }
    
    var body: some View {
        
        VStack{
            if(vm.isBusy){
                ProgressView()
            }else{
                Text("Login Screen").font(.title)
                EmailInput()
                PasswordInput()
                LoginButton()
            }
        }.padding()
        
    }
}
