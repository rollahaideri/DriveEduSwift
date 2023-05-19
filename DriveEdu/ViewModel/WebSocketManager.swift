import Combine
import Foundation

struct SubmittedChatMessage : Encodable {
//    let from: String
    let to: String
    let message: String
    
}

struct ReceivingChatMessage: Decodable, Identifiable {
    
    let id : String
    let date: String
    let message: String
}

final class ChatScreenModel: ObservableObject {
    
    @Published private(set) var messages: [ReceivingChatMessage] = []
    private var webSocketTask: URLSessionWebSocketTask? // 1
    // MARK: - Connection
    func connect() { // 2
        let url = URL(string: "ws://192.168.1.136:8080")! // 3
        var request = URLRequest(url: url)
        let authToken = UserDefaults.standard.string(forKey: "token") ?? ""
        request.addValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        webSocketTask = URLSession.shared.webSocketTask(with: request) // 4
        webSocketTask?.receive(completionHandler: onReceive) // 5
        webSocketTask?.resume() // 6
        
        print("\(authToken)")
    }
    
    func disconnect() { // 7
        webSocketTask?.cancel(with: .normalClosure, reason: nil) // 8
    }

    func send(text: String, recipientUsername: String) {
        
        
        print("Send clicked")
        let message = SubmittedChatMessage(
//            from: username,
                                           to: recipientUsername, message: text) // 1
        guard let json = try? JSONEncoder().encode(message), // 2
            let jsonString = String(data: json, encoding: .utf8)
        else {
            return
        }
        
        webSocketTask?.send(.string(jsonString)) { error in // 3
            if let error = error {
                print("Error sending message", error) // 4
            }
        }
    }
    
    
//    private func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
//        print("OnRecieve")
//        webSocketTask?.receive(completionHandler: onReceive) // 1
//        if case .success(let message) = incoming {
//            switch message {
//            case .string(let text):
//                guard let data = text.data(using: .utf8),
//                    let chatMessage = try? JSONDecoder().decode(ReceivingChatMessage.self, from: data)
//
//                else {
//                    print("Could not decode the data")
//                    return
//                }
//                DispatchQueue.main.async {
//                    self.messages.append(chatMessage)
//                }
//
//            case .data(let data):
//                guard let chatMessage = try? JSONDecoder().decode(ReceivingChatMessage.self, from: data)
//                else {
//                    print("Could not decode the data")
//                    return
//
//                }
//                DispatchQueue.main.async {
//                    self.messages.append(chatMessage)
//
//                }
//            @unknown default:
//                break
//            }
//        } else if case .failure(let error) = incoming {
//            print("Error", error)
//        }
//    }

    private func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
        print("OnRecieve")
        webSocketTask?.receive(completionHandler: onReceive) // 1
        if case .success(let message) = incoming { // 2
            onMessage(message: message)
        }
        else if case .failure(let error) = incoming { // 3
            print("Error", error)
        }
    }
    
    private func onMessage(message: URLSessionWebSocketTask.Message) { // 4
        if case .string(let text) = message {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            print("Received message:", text)// 5
            guard let data = text.data(using: .utf8),
                  
                    let chatMessage = try? decoder.decode(ReceivingChatMessage.self, from: data)
            else {
                print("error decoding data")
                return
            }

            DispatchQueue.main.async { // 6
                self.messages.append(chatMessage)
            }
        }
    }
    
    deinit { // 9
        disconnect()
    }
}
