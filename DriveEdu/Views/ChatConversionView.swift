//
//  ChatConversionView.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-02.
//

import Combine
import Foundation
import SwiftUI

struct ChatConversionView: View {
    
    
   

    @StateObject private var model = ChatScreenModel()
    @State private var message = ""
    let recipientUsername = "testusers"

    // MARK: - Events
    private func onAppear() {
        model.connect()
    }

    private func onDisappear() {
        model.disconnect()
    }

    private func onCommit() {
        if !message.isEmpty {
            model.send(text: message, recipientUsername: recipientUsername)
            message = ""
        }
    }

    private func scrollToLastMessage(proxy: ScrollViewProxy) {
        if let lastMessage = model.messages.last {
            withAnimation(.easeOut(duration: 0.4)) {
                proxy.scrollTo(lastMessage.id, anchor: .bottom)
            }
        }
    }

    // MARK: -
    var body: some View {
        VStack {
            // Chat history.
            ScrollView {
                ScrollViewReader{ proxy in
                    LazyVStack(spacing: 8) {
                        ForEach(model.messages) { message in
                            ChatMessageRow(message: message)
                                .id(message.id)
                        }
                    }
                    .padding(10)
                    .onChange(of: model.messages.count) { _ in
                        scrollToLastMessage(proxy: proxy)
                    }
                }
            }

            // Message field.
            HStack {
                TextField("Message", text: $message, onEditingChanged: { _ in }, onCommit: onCommit)
                    .padding(10)
                    .background(Color.secondary.opacity(0.2))
                    .cornerRadius(5)

                Button(action: onCommit) {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 20))
                        .padding(6)
                }
                .cornerRadius(5)
                .disabled(message.isEmpty)
                .hoverEffect(.highlight)
            }
            .padding()
        }
        .navigationTitle("Chat")
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

// MARK: - Individual chat message balloon
private struct ChatMessageRow: View {
    static private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()

    let message: ReceivingChatMessage


    var body: some View {
        HStack {


            VStack(alignment: .leading, spacing: 6) {


//                    Text(Self.dateFormatter.string(from: message.date))
//                        .font(.system(size: 10))
//                        .opacity(0.7)
                }

                Text(message.message)
            }

            .padding(10)

            .cornerRadius(5)


        }
        
    }


struct ChatConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ChatConversionView()
    }
}
