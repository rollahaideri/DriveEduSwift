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
        ScrollView (.vertical){
            VStack(alignment: .leading){
                ZStack (){
                    Image(systemName: "person.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.primary)
                        .frame(width: 90, height: 90)
                        .background(.cyan)
                        .cornerRadius(10)
                        .offset(x: -130, y: 90)
                        
                }
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .background(.blue)
                
                
                VStack(alignment: .leading, spacing: 10){
                    Text("\(firstName + "" + lastName)").font(.title3)
                    Text(city).font(Font.custom("Poppins-Medium", size: 20)).foregroundColor(Color("Border-Btn"))
                    Divider()
                    Text(drivingLicense)
                    Divider()
                    
                    Text(carModel).font(.subheadline)
                    
                }.padding(EdgeInsets(top: 40, leading: 25, bottom: 10, trailing: 10))
            }
        }
        
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(firstName: "John", lastName: "Doe", city: "Stockholm", drivingLicense: "B-manuel", carModel: "Volvo")
    }
}
