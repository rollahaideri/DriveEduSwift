//
//  Chat.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-02.
//

import Foundation

struct Chat: Identifiable {
    let id: UUID = UUID()
    let message: String
    let sender: User
    let receiver: User
    
}
