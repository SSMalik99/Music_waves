//
//  ProfileScreen.swift
//  Music_waves
//
//  Created by Saravjeet Singh on 2023-04-04.
//

import SwiftUI

struct ProfileScreen: View {
    @EnvironmentObject var vm: UserStateViewModel
    
    let userDetail = UserStateViewModel.getUserDetail()
    
    
    var body: some View {
        
        VStack{
            
            HStack{
                Text("Email : ")
                Text("\(userDetail["email"]!)")
            }
            
            HStack{
                Text("Name : ")
                Text("\(userDetail["name"]!)")
            }
            
        }
        
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
