//
//  ChatConversionView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-02.
//

import SwiftUI

struct ChatConversionView: View {
    
    @ObservedObject var webSocketManager = WebSocketManager()
    @State var messageText: String = ""
    @State var receiverUsername: String = ""
    @State var chats: [Chat] = []
    
    var body: some View {
        VStack {
            // Display chat messages
            List(chats) { chat in
                Text("\(chat.sender.username): \(chat.message)")
            }
            
            // Input fields and send button
            HStack {
                TextField("Enter message", text: $messageText)
                TextField("Enter receiver username", text: $receiverUsername)
                Button("Send") {
                    let sender = User( username: "YOUR_USERNAME", password: "")
                    let receiver = User(username: receiverUsername, password: "")
                    let chat = Chat(message: messageText, sender: sender, receiver: receiver)
                    chats.append(chat)
                    webSocketManager.sendPrivateMessage(message: messageText, receiverUsername: receiverUsername)
                }
            }
        }
    }
        

    }
    


struct ChatConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ChatConversionView()
    }
}
