
//
//  CardView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-03-29.
//

import SwiftUI



struct TestView: View {
    
    let firstName: String
    let lastName: String
    let city: String
    let drivingLicense: String
    let carModel: String
    
    var body: some View {
        NavigationLink (destination: DetailView(firstName: firstName, lastName: lastName, city: city, drivingLicense: drivingLicense, carModel: carModel)){
            VStack (alignment: .leading){
                HStack(alignment: .top) {
                    Image("person.profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                        .background{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(lineWidth: 6)
                                .fill(.blue)
                        }
                        .offset(y: -30)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text("\(firstName + " " + lastName)")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        HStack {
                            Image("ic-location")
                            Text(city)
                                .font(.system(size: 14))
                                .opacity(0.6)
                        }
                    }
                }
                .padding(.horizontal, 10)
                .frame(alignment: .topLeading)
                
                HStack {
                    HStack (spacing: -2){
                        Group {
                            Image(systemName: "creditcard")
                                .padding(SwiftUI.EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                            
                            VStack(alignment: .leading){
                                Text(LocalizedStringKey("licenseTxt"))
                                    .font(.system(size: 13))
                                Text(drivingLicense)
                                    .font(.system(size: 13))
                                    .foregroundColor(.black.opacity(0.6))
                            }
                        }
                        .padding(.horizontal, 7)
                        .padding(.vertical, 7)
                    }
                    .frame(alignment: .leading)
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .overlay (alignment: .leading){
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .frame(width: 5)
                                    .foregroundColor(.blue)
                            }
                    }
                    
                    HStack (spacing: -2){
                        Group {
                            Image(systemName: "car")
                                .padding(SwiftUI.EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 0))
                            
                            VStack (alignment: .leading){
                                Text(LocalizedStringKey("carTxt"))
                                    .font(.system(size: 13))
                                Text(carModel)
                                    .font(.system(size: 13))
                                    .foregroundColor(.black.opacity(0.6))
                            }
                        }
                        .padding(.horizontal, 7)
                        .padding(.vertical, 7)
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.white)
                            .overlay (alignment: .leading){
                                RoundedRectangle(cornerRadius: 5, style: .continuous)
                                    .frame(width: 5)
                                    .foregroundColor(.blue)
                            }
                    }
                }
                .padding(.horizontal, 10)
                .frame(alignment: .topLeading)
            }
            .frame(width: UIScreen.main.bounds.width * 0.86, alignment: .topLeading)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue.opacity(0.11))
                    .shadow(color: .black.opacity(0.3), radius: 3, x: 4, y: 5)
                    .overlay (alignment: .trailing){
                        RoundedRectangle(cornerRadius: 5, style: .continuous)
                            .frame(width: 40)
                            .foregroundColor(.blue)
                    }
                    .overlay (alignment: .trailing){
                        Text(LocalizedStringKey("supervisorTxt"))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .rotationEffect(.degrees(-90))
                            .offset(x: 25)
                    }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(firstName: "", lastName: "", city: "", drivingLicense: "", carModel: "")
            .previewLayout(.sizeThatFits)
        
    }
}
