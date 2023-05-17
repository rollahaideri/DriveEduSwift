//
//  SocketManager.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-06.
//

import Foundation
import SocketIO

class socketManager: ObservableObject {
    private var manager = SocketManager(socketURL: URL(string: "ws://192.168.1.136:8080")!, config: [.log(true), .compress])
    @Published var messages = [String]()
    
    init(){
        let socket = manager.defaultSocket
        socket.on(clientEvent: .connect) { (data, ack) in
            print("Connected")
            socket.emit("NodJS Server Port", "Hi Node.js server!")
        }
        
        socket.on("iOS Client Port") { [weak self](data, ack) in
            if let data = data[0] as? [String: String],
               let rawMessage = data["msg"] {
                DispatchQueue.main.async {
                    self?.messages.append(rawMessage)
                }
            }
        }
        socket.connect()
    }
    
}
