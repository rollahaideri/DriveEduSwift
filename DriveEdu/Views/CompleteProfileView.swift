//
//  CompleteProfileView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-16.
//

import SwiftUI

struct CompleteProfileView: View {
    
    @ObservedObject var viewModel: AuthViewModel
    @State private var selectedOption = 0
    private let pickerOptions = ["Manual", "Automatic"]
    var body: some View {
        
        
                

            Form {
                Section {
                    TextField("First Name", text: $viewModel.profile.firstName)
                        .textFieldStyle(.plain)
                    
                } header: {
                    Text("First Name *")
                        .textCase(.none)
                }
                Section {
                    TextField("Last Name", text: $viewModel.profile.lastName)
                        .textFieldStyle(.plain)
                    
                } header: {
                    Text("Last name *")
                        .textCase(.none)
                }
                Section {
                    TextField("City", text: $viewModel.profile.city)
                        .textFieldStyle(.plain)
                    
                } header: {
                    Text("City *")
                        .textCase(.none)
                }
                
                Section {
                    Picker(selection: $selectedOption, label: Text("Picker")) {
                        ForEach(0..<2) { index in
                            Text(pickerOptions[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                } header: {
                    Text("Driving license type *")
                        .textCase(.none)
                }
                .listRowBackground(Color.clear)
            
                
                Section {
                    TextField("Car Model", text: $viewModel.profile.carModel)
                        .textFieldStyle(.plain)
                } header: {
                    Text("Car Model (optional)")
                        .textCase(.none)
                }
                
                
                
                Button {
                    viewModel.profile.drivingLicense = pickerOptions[selectedOption]
                    viewModel.completeProfile()
                } label: {
                    ZStack {
                        Text("Save & Publish")
                            .padding(.horizontal,70)
                            .padding(.vertical, 15)
                        .foregroundColor(.white)
                        
                    } .background(Color.blue)
                        .cornerRadius(10)
                        
                }
                .listRowBackground(Color.clear)
                .padding()
                
            }
            
           
            
        
        
    }
}

struct CompleteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProfileView(viewModel: AuthViewModel())
    }
}
