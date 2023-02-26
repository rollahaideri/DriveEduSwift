//
//  ViewModel.swift
//  DriveEdu
//
//  Created by Rohullah Haideri on 2023-02-23.
//

import Foundation
import Alamofire

struct LoginResponse: Codable {
    let token: String
}

struct Constants {
    static let baseUrl = "http://192.168.1.67:4000"
    static let loginUrl = "\(baseUrl)/user/login"
    static let contentType = "application/json"
}

class AuthViewModel: ObservableObject {
    
    
    
    @Published var user = User(username: "", password: "")
    @Published var isShowingError: Bool = false
    var errorMessage = ""
    var isLoggingIn = false
    
    func login() {
        
        guard !user.username.isEmpty else {
            isShowingError = true
            errorMessage = "Please enter your username"
            return
        }
        
        guard !user.password.isEmpty else {
            isShowingError = true
            errorMessage = "Please enter your password"
            return
        }
        
        let parameters = [
            "username": user.username,
            "password": user.password
        ]
        let headers: HTTPHeaders = [
            "Content-Type": Constants.contentType
        ]
        
        AF.request(Constants.loginUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: LoginResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    UserDefaults.standard.set(response.token, forKey: "token")
                    self.isLoggingIn = true
                    self.isShowingError = false
                    // TODO: Handle successful login
                case .failure(let error):
                    self.isShowingError = true
                    self.errorMessage = "Failed to decode response: \(error.localizedDescription)"
                    self.isLoggingIn = false
                }
            }
    }
 // login end
    
    
}
