//
//  RegisterScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-01.
//

import SwiftUI

struct RegisterScreen: View {
    @EnvironmentObject var vm: UserStateViewModel
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    var body: some View {
        
        VStack {
            if(vm.isBusy){
                ProgressView()
            }else {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .padding(.top,20).padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.top,20).padding(.bottom, 20)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(.roundedBorder)
                .padding(.top,20).padding(.bottom, 20)
            
            if(vm.error != "" ){
                Text(vm.error).foregroundColor(.red)
            }
            
            Button(action: {
                Task {
                    await vm.register(
                        email: email,
                        password:password,
                        confirmPassword: confirmPassword
                    )
                }
            }) {
                Text("Register")
            }.padding(10).background(Color("DarkMainColor")).foregroundColor(.white).cornerRadius(8)
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
