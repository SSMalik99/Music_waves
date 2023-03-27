//
//  UserStateViewModel.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-03-26.
//

import Foundation

enum UserStateError: Error{
    case signInError, signOutError
}

@MainActor
class UserStateViewModel: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var isBusy = false
    @Published var userToken = "N/A"
    
    
    init (){
        userToken = UserDefaults.standard.string(forKey: "userToken") ?? "N/A"
    }
    
    
    func signIn(email: String, password: String) async -> Result<Bool, UserStateError>  {
        isBusy = true
        do{
            try await Task.sleep(nanoseconds:  1_000_000_000)
            isLoggedIn = true
            isBusy = false
            UserDefaults.standard.set("User_is_logged_in", forKey: "userToken")
            return .success(true)
            
        }catch{
            isBusy = false
            return .failure(.signInError)
        }
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
