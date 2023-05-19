//
//  Chat.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-05-02.
//

import Foundation

struct Chat: Codable , Identifiable {
    
    let fromUsername: String
    let username: String
    let id: String
    let date: String
    let message: String
    
    
    
}
