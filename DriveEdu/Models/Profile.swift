//
//  Instructor.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-03-29.
//

import Foundation

struct Profile: Codable , Equatable {
        let username: String
        var firstName: String
        var lastName: String
        var city: String
        var drivingLicense: String
        var carModel: String
}



