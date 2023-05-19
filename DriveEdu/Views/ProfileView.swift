//
//  ProfileView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-16.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        
            List{
                Section {
                    NavigationLink(destination: CompleteProfileView(viewModel: AuthViewModel()), label: {
                        HStack (spacing: 13){
                            Image("ic-profile-edit")
                            
                            Text(viewModel.profileExist ? LocalizedStringKey("completeProfileTxt") : LocalizedStringKey("updateProfileTxt"))
                                .font(.system(size: 16))
                        }.padding(.vertical, 7)
                    })
                    NavigationLink(destination: Text("HEllo"), label: {
                        HStack (spacing: 13){
                            Image("ic-user-gear")
                            Text(LocalizedStringKey("manageAccountTxt"))
                                .font(.system(size: 16))
                        }.padding(.vertical, 7)
                            
                    })
                    Button {
                        print("User logout")
                        
                    } label: {
                        HStack (spacing: 13){
                            Image("ic-exit")
                            Text(LocalizedStringKey("logoutTxt"))
                                .font(.system(size: 16))
                                .foregroundColor(.primary)
                        }.padding(.vertical, 7)
                    }

                } header: {
                    Text(LocalizedStringKey("accountTxt"))
                        .font(.title2)
                        .fontWeight(.bold)
                        .textCase(.none)
                        
                }
                Section {
                    
                } header: {
                    Text("Settings")
                        .font(.title2)
                        .fontWeight(.bold)
                        .textCase(.none)
                        
                }
                
                
            }
                .listStyle(.grouped)
//                .scrollContentBackground(.hidden)
                .navigationBarTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
//            .toolbarBackground(.visible, for: .navigationBar)

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel:  AuthViewModel())
    }
}
