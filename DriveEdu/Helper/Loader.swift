//
//  Loader.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-01.
//

import SwiftUI

struct Loader: View {
    @State var animate = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.blue, .blue.opacity(0.5)]), center: .center), style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .frame(width: 35, height: 35)
                .rotationEffect(.init(degrees: self.animate ? 360 : 0))
                .animation(Animation.linear(duration: 0.7).repeatForever(autoreverses: false), value: animate)

        }.onAppear{animate.toggle()}
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
