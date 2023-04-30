//
//  ChatViewModel.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-04-24.
//

import Foundation

class ChatScreenModel: ObservableObject {
    private var webSocketTask: URLSessionWebSocketTask? // 1
    // MARK: - Connection
    func connect() { // 2
        let url = URL(string: "ws://192.168.1.136:4000")! // 3
        webSocketTask = URLSession.shared.webSocketTask(with: url) // 4
        webSocketTask?.receive(completionHandler: onReceive) // 5
        webSocketTask?.resume() // 6
    }
    
    func disconnect() { // 7
        webSocketTask?.cancel(with: .normalClosure, reason: nil) // 8
    }

    private func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
        // Nothing yet...
    }
    
    deinit { // 9
        disconnect()
    }
}
