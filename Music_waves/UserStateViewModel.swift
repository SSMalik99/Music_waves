//
//  UserStateViewModel.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-26.
//

import Foundation
import Firebase

enum UserStateError: Error{
    case signInError, signOutError
}

enum UserRegisterError : Error {
    case emailExists, passwordError, serverError, passwordMisMatch
}

@MainActor
class UserStateViewModel: ObservableObject {
    
    
    @Published var isLoggedIn = false
    @Published var isBusy = false
    @Published var userToken = "N/A"
    @Published var error = ""
    
    
    init (){
        userToken = UserDefaults.standard.string(forKey: "userToken") ?? "N/A"
//        FirebaseApp.configure()
    }
    
    func register(email : String, password: String, confirmPassword : String) async -> Result<Bool, UserRegisterError> {
        
        
        do{
            if(confirmPassword != password) {
                return .failure(.passwordMisMatch)
            }
            
             Auth.auth().createUser(withEmail: email, password: password){ [unowned self] (data, error) in
                if let error = error {
                    self.error = error.localizedDescription
                } else {
                    
                    self.isLoggedIn = true
                    UserDefaults.standard.set("User_is_logged_in", forKey: "userToken")
                    
                }
              }
//            try await Task.sleep(nanoseconds:  1_000_000_000)
            
            return .success(true)
            
        }
//        catch{
//            return .failure(.serverError)
//        }
        
    }
    
    func signIn(email: String, password: String) async -> Result<Bool, UserStateError>  {
        isBusy = true
        Auth.auth().signIn(withEmail: email, password: password){ [unowned self] (data, error) in
               if let error = error {
                   self.error = error.localizedDescription
                   self.isBusy = false
                   
               } else {
                   
                   self.isLoggedIn = true
                   self.isBusy = false
                   UserDefaults.standard.set("User_is_logged_in", forKey: "userToken")
                   
               }
             }
            
            return .success(true)
    }
    
    func signOut() async -> Result<Bool, UserStateError>  {
        isBusy = true
        do{
            try await Task.sleep(nanoseconds: 1_000_000_000)
            isLoggedIn = false
            isBusy = false
            UserDefaults.standard.set("N/A", forKey: "userToken")
            userToken = "N/A"
            return .success(true)
        }catch{
            isBusy = false
            return .failure(.signOutError)
        }
    }
    
    
}
