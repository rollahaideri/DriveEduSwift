//
//  DetailView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-14.
//

import SwiftUI

struct DetailView: View {
    
    let firstName: String
    let lastName: String
    let city: String
    let drivingLicense: String
    let carModel: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "person")
                .font(.system(size: 60))
            Text("\(firstName) \(lastName)")
                .font(.title)
            Text(city)
                .font(.subheadline)
            Text(drivingLicense)
                .font(.subheadline)
            Text(carModel)
                .font(.subheadline)
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(firstName: "John", lastName: "Doe", city: "Stockholm", drivingLicense: "B-manuel", carModel: "Volvo")
    }
}
