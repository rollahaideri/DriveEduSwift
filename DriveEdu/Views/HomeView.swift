//
//  HomeView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-26.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        TabView {
            Text("First View")
                .tabItem {
                    Image(systemName: "house")
                    Text("First")
                }
                .toolbarBackground(.visible, for: .tabBar)
            
            Text("Second View")
                .tabItem {
                    Image(systemName: "ellipsis.message.fill")
                    Text("Messages")
                }
            
            Text("Third View")
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Third")
                }
            Text("Forth View")
                .tabItem {
                    Image(systemName: "gear.circle")
                    Text("Settings")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
