//
//  ContentView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-13.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @StateObject var viewModel = AuthViewModel()
    
    
    var body: some View {
        VStack {
            LoginView(viewModel: viewModel)
        } // End VStack
        .padding()
    }
    
}
        
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
