//
//  LoginView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-24.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @State private var isActive: Bool = false
    
//    @State var username: String = ""
//    @State var password: String = ""
    
    var body: some View {
        
//        NavigationView{
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
                
                if viewModel.isShowingError {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                if viewModel.isLoggingIn {
                   Text("User logged in")
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
                            .bold()
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                
                .padding(.top, 20)
                
                Spacer()
                HStack{
                    Text(LocalizedStringKey("noAccountMsg"))
                    NavigationLink(destination: RegisterView(viewModel: AuthViewModel(), isActive: self.$isActive), isActive: self.$isActive) {
                        Text(LocalizedStringKey("registerTxt"))
                    }
                }
                .padding(.bottom, 20)
            }
        }
        
    }
//}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: AuthViewModel())
            .previewDevice("iPhone SE (3rd generation)")
        LoginView(viewModel: AuthViewModel())
            .previewDevice("iPhone 14 Pro Max")
    }
}
