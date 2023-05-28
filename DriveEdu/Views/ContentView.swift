//
//  ContentView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-13.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    
    @ObservedObject var viewModel : AuthViewModel
       
       
       var body: some View {
           
           if  viewModel.isAuthenticated()  {
                   HomeView(viewModel: viewModel)
               } else {
                   LoginView(viewModel: viewModel)
               }
           
       }
}
        
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: AuthViewModel())
    }
}
