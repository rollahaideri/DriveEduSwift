//
//  FirstView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-13.
//

import SwiftUI


struct FirstView: View {
    @ObservedObject var viewModel: AuthViewModel
    @State private var searchText = ""
    var body: some View {
        NavigationView {
                    List(viewModel.profiles.filter {
                        searchText.isEmpty ? true : $0.firstName.localizedStandardContains(searchText) ||
                            $0.lastName.localizedStandardContains(searchText) ||
                            $0.city.localizedStandardContains(searchText) ||
                            $0.carModel.localizedStandardContains(searchText)
                    } .reversed(), id: \.username) { profile in
                        CardView(firstName: profile.firstName, lastName: profile.lastName, city: profile.city, drivingLicense: profile.drivingLicense, carModel: profile.carModel)
                    }
                    .scrollContentBackground(.hidden)
                    .searchable(text: $searchText, prompt: LocalizedStringKey("searchTxt")) // add the searchable modifier
                    .navigationTitle("Profiles") // add a navigation title
                }
            }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView(viewModel: AuthViewModel())
    }
}
