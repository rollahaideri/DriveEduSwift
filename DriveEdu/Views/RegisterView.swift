//
//  LoginView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-24.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @State private var confirmPassword = ""
    
    //    @State var username: String = ""
    //    @State var password: String = ""
    @Binding var isActive: Bool
    
    
    var body: some View {
        
        
        VStack {
            Spacer()
            Text(LocalizedStringKey("welcomeMsg"))
                .font(.title2)
                .padding()
            
            TextField(LocalizedStringKey("usernameTxt"), text: $viewModel.user.username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                
            SecureField(LocalizedStringKey("passwordTxt"), text: $viewModel.user.password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            SecureField(LocalizedStringKey("confirmPasswordTxt"), text: $confirmPassword)
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
                Text("You'r account created successfully")
                
                
            }
            
            Button(action: {
                if viewModel.user.password == confirmPassword {
                    viewModel.register()
                } 
            }) {
                if viewModel.isLoggingIn {

                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)

                } else {
                    Text(LocalizedStringKey("registerTxt"))
                        .foregroundColor(.white)
                        .bold()
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .disabled(viewModel.isLoggingIn)
            .padding(.top, 20)
            
            Spacer()
            HStack{
                Text(LocalizedStringKey("haveAccountMsg"))
                Button {
                    self.isActive = false // go back to LoginView root
                } label: {
                    Text(LocalizedStringKey("loginBtn"))
                }

                    
                }
            }.navigationBarBackButtonHidden(true) // hide default back button
            .padding(.bottom, 20)
        }
        // end of navigationView
        
        
        
    }

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthViewModel())
            .previewDevice("iPhone SE (3rd generation)")
        LoginView(viewModel: AuthViewModel())
            .previewDevice("iPhone 14 Pro Max")
    }
}
