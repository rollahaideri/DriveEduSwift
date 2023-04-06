//
//  CardView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-03-29.
//

import SwiftUI



struct CardView: View {
    
    let person: Instructor
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                
                
                
                ZStack{
                    Image(person.profilePhoto)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 40)
                        .offset(y: -40)
                    
                }
                
            }
            
            
            .frame(width: geometry.size.width * 0.95, height: geometry.size.height * 0.1)
            .background(Color(.blue))
            .padding(.horizontal, 10)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: person1)
            .previewLayout(.sizeThatFits)
    }
}
