//
//  LoginView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    
//    @State var username: String = ""
//    @State var password: String = ""
    
    var body: some View {
        VStack {
            Text(LocalizedStringKey("loginBtn"))
                .font(.largeTitle)
                .padding()
            
            TextField("Username", text: $viewModel.user.username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField("Password", text: $viewModel.user.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            if viewModel.isShowingError {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if viewModel.isLoggingIn {
                Text("You'r succefull loggedin")
                
                    
            }
            
            Button(action: {
                viewModel.login()
            }) {
                if viewModel.isLoggingIn {
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                    
                } else {
                    Text(LocalizedStringKey("loginBtn"))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .disabled(viewModel.isLoggingIn)
            .padding(.top, 20)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthViewModel())
    }
}
