//
//  ChatView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-19.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel : AuthViewModel
    
    var body: some View {
        
        VStack {
            List(viewModel.chats) { chat in
                VStack(alignment: .leading) {
                    Text(chat.fromUsername)
                        .font(.headline)
                    Text(chat.message)
                        .font(.subheadline)
                }
            }
            
        }
        .onAppear {
            viewModel.fetchChats()
            print("List chats\(viewModel.chats)")
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: AuthViewModel())
    }
}
