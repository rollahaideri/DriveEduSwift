//
//  TestView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-11.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
            VStack (alignment: .leading){
                
                HStack {
                    Text("HWorr")
                    Text("JHJJj")
                }
                .frame(width: 100, height: 100)
                .background(Color.white)
                
            }
//            .offset(x: -100)
            
            .frame(width: 350, height: 110, alignment: .leading)
            
            
            .background(Color.gray)
        
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
