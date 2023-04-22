//
//  CardView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-03-29.
//

import SwiftUI



struct CardView: View {
    
    let firstName: String
    let lastName: String
    let city: String
    let drivingLicense: String
    let carModel: String
    
    var body: some View {
        NavigationLink (destination: DetailView(firstName: firstName, lastName: lastName, city: city, drivingLicense: drivingLicense, carModel: carModel)){
            GeometryReader { geo in
                
                VStack (alignment: .leading) {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 70)
                            .border(.blue, width: 2)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(firstName + " " + lastName)")
                                .fontWeight(.medium)
                                .font(.system(size: 16))
                            HStack {
                                Image(systemName: "location.circle.fill")
                                    .foregroundColor(.blue)
                                Text(city)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 14))
                            }
                            
                        }
                    }
                    .frame(width: .infinity)
                    //
                    
                    HStack {
                        HStack {
                            Image(systemName: "creditcard.fill")
                                .padding(.leading, 5)
                                .rotationEffect(.degrees(-50))
                                .font(.system(size: 20))
                            
                            VStack (alignment: .leading, spacing: 4){
                                Text(LocalizedStringKey("licenseTxt"))
                                    .fontWeight(.medium)
                                    .font(.system(size: 13))
                                
                                Text(drivingLicense)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12))
                            }
                        }
                        .frame(maxWidth: 145)
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(alignment: .leading){
                            Rectangle()
                                .foregroundColor(Color.blue)
                                .frame(width: 7, height: nil )
                            //TODO: Make the cornerRadius only on topLeading & bottomLeading
                                .cornerRadius(5)
                        }
                        
                        HStack {
                            Image(systemName: "car")
                                .font(.system(size: 20))
                            
                            VStack (alignment: .leading, spacing: 4){
                                Text(LocalizedStringKey("carTxt"))
                                    .fontWeight(.medium)
                                    .font(.system(size: 13))
                                
                                Text(carModel)
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 12))
                            }
                        }
                        .frame(maxWidth: 110)
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(alignment: .leading){
                            Rectangle()
                                .foregroundColor(Color.blue)
                                .frame(width: 7, height: nil )
                            //TODO: Make the cornerRadius only on topLeading & bottomLeading
                                .cornerRadius(5)
                            
                        }
                    }.padding(.trailing, 45)
                        
                }
                .frame(width: geo.size.width , height: geo.size.height)
                .background(Color.blue.opacity(0.1))
                .overlay(alignment: .trailing) {
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(width: 40)
                        .offset(x: 25)
                    
                    Text(LocalizedStringKey("supervisorTxt"))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .rotationEffect(.degrees(-90))
                        .offset(x: 25)
                }
                
            }
            .frame(width: 350, height: 160)
        .cornerRadius(5)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(firstName: "", lastName: "", city: "", drivingLicense: "", carModel: "")
            .previewLayout(.sizeThatFits)
    }
}
