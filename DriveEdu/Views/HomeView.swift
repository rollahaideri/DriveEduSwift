//
//  HomeView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-26.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    var body: some View {
        
        TabView(selection: $selection) {
            FirstView(viewModel: AuthViewModel())
                .tabItem {
                    selection == 0 ? Image("ic-house-window-fill").renderingMode(.template) :
                    Image("ic-house-window")
                        .renderingMode(.original)
                    Text("Home")
                }.tag(0)
                
//                .toolbarBackground(.visible, for: .tabBar)
            
            Text("Work in progress...")
                .tabItem {
                    selection == 1 ? Image("ic-message-fill").renderingMode(.template) :
                    Image("ic-message").renderingMode(.original)
                    Text("Messages")
                }.tag(1)
//                .toolbarBackground(.visible, for: .tabBar)
            
            ProfileView()
                .tabItem {
                    selection == 2 ? Image("ic-profile-fill").renderingMode(.template) :
                    Image("ic-profile").renderingMode(.original)
                    Text("Profile")
                }.tag(2)
//                .toolbarBackground(.visible, for: .tabBar)
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
