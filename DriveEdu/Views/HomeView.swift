//
//  HomeView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-26.
//

import SwiftUI

struct HomeView: View {
    @State private var selection = 0
    @ObservedObject var viewModel : AuthViewModel
    var body: some View {
        
        TabView(selection: $selection) {
            FirstView(viewModel: viewModel)
                .tabItem {
                    selection == 0 ? Image("ic-house-window-fill").renderingMode(.template) :
                    Image("ic-house-window")
                        .renderingMode(.original)
                    Text(LocalizedStringKey("homeTxt"))
                }.tag(0)
                
//                .toolbarBackground(.visible, for: .tabBar)
            
//            Text("Work in progress...")
//                .tabItem {
//                    selection == 1 ? Image("ic-message-fill").renderingMode(.template) :
//                    Image("ic-message").renderingMode(.original)
//                    Text(LocalizedStringKey("messagesTxt"))
//                }.tag(1)
//                .toolbarBackground(.visible, for: .tabBar)
            
            ProfileView(viewModel: viewModel)
                .tabItem {
                    selection == 1 ? Image("ic-profile-fill").renderingMode(.template) :
                    Image("ic-profile").renderingMode(.original)
                    Text(LocalizedStringKey("profileTxt"))
                }.tag(1)
//                .toolbarBackground(.visible, for: .tabBar)
            
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: AuthViewModel())
    }
}
