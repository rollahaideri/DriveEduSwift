//
//  FirstView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-13.
//

import SwiftUI


struct FirstView: View {
    @StateObject var viewModel = AuthViewModel()
    @State private var searchText = ""
    @State var isLoading = false
    @State var hasAppeared = false // new state variable to keep track of whether the view has appeared or not
    
    var body: some View {
        VStack{
            List(viewModel.profiles.filter {
                searchText.isEmpty ? true : $0.firstName.localizedStandardContains(searchText) ||
                $0.lastName.localizedStandardContains(searchText) ||
                $0.city.localizedStandardContains(searchText) ||
                $0.carModel.localizedStandardContains(searchText)
            }
                .reversed(), id: \.username) { profile in
                    CardView(firstName: profile.firstName, lastName: profile.lastName, city: profile.city, drivingLicense: profile.drivingLicense, carModel: profile.carModel)
                }
                
                .listStyle(.plain)
                .searchable(text: $searchText, prompt: LocalizedStringKey("searchTxt")) // add the searchable modifier
            
        }.overlay(content: {
            if isLoading {
                Loader()
            }
        })
        .refreshable {
            viewModel.fetchProfiles()
        }
        .onAppear{
            if !hasAppeared { // check if the view has appeared before or not
                self.isLoading = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    viewModel.fetchProfiles()
                    self.isLoading = false
                }
                hasAppeared = true // set the flag to true so that this block is not executed again
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(viewModel: AuthViewModel())
    }
}
