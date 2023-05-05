//
//  WebSocketManager.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-03.
//

import Foundation
import Starscream

class WebSocketManager: ObservableObject, WebSocketDelegate {
    
    let socket: WebSocket
    
    init() {
        // Replace "YOUR_SERVER_URL" with the actual URL of your server
        let socketURL = URL(string: "ws://192.168.1.136:3000")!
        socket = WebSocket(request: URLRequest(url: socketURL))
        socket.delegate = self
        socket.connect()
    }
    
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
        case .connected:
            print("WebSocket connection is established")
        case .disconnected(let reason, let code):
            print("WebSocket connection is disconnected: \(reason) with code: \(code)")
        case .text(let text):
            print("Received text: \(text)")
        case .binary(let data):
            print("Received data: \(data)")
        case .pong:
            print("Received pong")
        case .ping:
            print("Received ping")
        case .error(let error):
            print("Error: \(error?.localizedDescription ?? "Unknown error")")
        case .viabilityChanged(let isViable):
            print("WebSocket viability changed: \(isViable)")
        case .reconnectSuggested(let shouldReconnect):
            print("WebSocket should reconnect: \(shouldReconnect)")
        case .cancelled:
            print("Websocket cancelled")
        }
    }
    
    func sendPrivateMessage(message: String, receiverUsername: String) {
        let privateMessage = ["message": message, "receiverUsername": receiverUsername]
               let jsonData = try! JSONSerialization.data(withJSONObject: privateMessage, options: [])
               socket.write(data: jsonData)
    }
    
    func disconnect() {
        socket.disconnect()
    }
}
