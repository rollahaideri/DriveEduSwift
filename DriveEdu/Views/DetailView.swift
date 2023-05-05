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
                ZStack {
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
                    
                    HStack {
                        Text("\(firstName + " " + lastName)").font(.title3)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 5)
                            .background{
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .stroke()
                                    .fill(.blue.opacity(0.5))
                        }
                        Spacer()
                        NavigationLink(destination: ChatConversionView()) {
                           
                                Text("Send message")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 7)
                                    .background(.blue)
                                    .cornerRadius(5)
                                    
                           

                        }

                    }
                    
                    Text("Driving License:")
                        .font(.system(size: 12))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack (spacing: 1){
                        Group {
                            Image(systemName: "creditcard.fill")
                                .rotationEffect(.degrees(-50))
                                .font(.system(size: 20))
                            Text(drivingLicense)
                        }
                        .padding(.horizontal, 7)
                        .padding(.vertical,10)
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.blue.opacity(0.1))
                    }
                    
                    Divider()
                    
                    Text("City:")
                        .font(.system(size: 12))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack (spacing: 1){
                        Group {
                            Image(systemName: "location.square.fill")
                                
                                .font(.system(size: 20))
                            Text(city)
                        }
                        .padding(.horizontal, 7)
                        .padding(.vertical,10)
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.blue.opacity(0.1))
                    }
                    
                    Divider()
                    
                    Text("Car Model:")
                        .font(.system(size: 12))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    
                    HStack (spacing: 1){
                        Group {
                            Image(systemName: "car")
                                
                                .font(.system(size: 20))
                            Text(carModel)
                        }
                        .padding(.horizontal, 7)
                        .padding(.vertical,10)
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .fill(.blue.opacity(0.1))
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
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
