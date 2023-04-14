//
//  TestView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-11.
//

import SwiftUI

struct TestView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                // Your list items
            }
            .searchable(text: $searchText) {
                Text("Search")
                    .foregroundColor(.gray)
            }
            .searchable(text: $searchText) {
                HStack {
                    Text("Hello")
                }.frame(width: 200, height: 100)
                    .background(Color.red)
                    
                    
                    
                    
                    
            }
            .navigationTitle("My List")
        }
    
}

        
        func getData() -> [String] {
            return [            "Package 1",            "Package 2",            "Package 3",            "Package 4",            "Package 5",            "Package 6",            "Package 7",            "Package 8",            "Package 9",            "Package 10",            "Package 11",            "Package 12",            "Package 13",            "Package 14",            "Package 15",            "Package 16",            "Package 17",            "Package 18",            "Package 19",            "Package 20"        ]
        }
    }
    
    
    
    

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
