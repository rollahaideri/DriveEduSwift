//
//  TestStack.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-02.
//

import SwiftUI

struct TestStack: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                
            }
            .frame(width: 100, height: 100)
            .background(Color.red)
            Text("Hello")
        }
        .frame(width: 380, height: 200)
        .background(Color.blue)
        
    }
}

struct TestStack_Previews: PreviewProvider {
    static var previews: some View {
        TestStack()
    }
}
