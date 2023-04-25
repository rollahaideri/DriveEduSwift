//
//  ChatView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-25.
//

import SwiftUI

struct ChatView: View {
    @StateObject private var model = ChatScreenModel() // <this
    @State private var message = ""
    
    var body: some View {
        VStack {
            
        }
        .onAppear{model.connect()}
        .onDisappear{model.disconnect()}
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
