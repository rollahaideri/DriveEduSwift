//
//  TestView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-11.
//

import SwiftUI

struct TestView: View {
    var title: String
       var price: String
       var description: String
       var phoneNumber: String
       var image: String?

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
                        Text(title).font(.title3)
                        Text(price + " Kr").font(Font.custom("Poppins-Medium", size: 20)).foregroundColor(Color("Border-Btn"))
                        Divider()
                        Text(phoneNumber)
                        Divider()
                        Text("Description").font(Font.custom("Poppins-Medium", size: 22))
                        Text(description).font(.subheadline)
                        
                    }.padding(EdgeInsets(top: 40, leading: 25, bottom: 10, trailing: 10))
                }
            }
            
        
            
    }
}
    

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(title: "John doe", price: "100", description: "This is a desc", phoneNumber: "000")
    }
}
