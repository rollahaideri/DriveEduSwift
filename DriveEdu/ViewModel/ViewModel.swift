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
struct RegisterResponse: Codable {
    let message: String
}


struct Constants {
    static let baseUrl = "http://192.168.1.136:4000"
    static let loginUrl = "\(baseUrl)/user/login"
    static let registerUrl = "\(baseUrl)/user/signup"
    static let profileUrl = "\(baseUrl)/profile"
    static let contentType = "application/json"
}

class AuthViewModel: ObservableObject {
    
    
    @Published var profiles : [Profile] = []
    @Published var profile = Profile(username: "", firstName: "", lastName: "", city: "", drivingLicense: "", carModel: "")
    @Published var user = User(username: "", password: "")
    @Published var isShowingError: Bool = false
    var errorMessage = ""
    var isLoggingIn = false
    @Published var selection: String?
    
//    init() {
//        // Check if the user has a valid token stored in UserDefaults
//        
//        self.fetchProfiles()
//    }
    
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
                    print("loggedin successfully")
                    // TODO: Handle successful login
                case .failure(let error):
                    self.isShowingError = true
                    self.errorMessage = "Failed to decode response: \(error.localizedDescription)"
                    self.isLoggingIn = false
                }
            }
    }
    // login end
    
    func register() {
        guard !user.username.isEmpty else {
            isShowingError = true
            errorMessage = "Please enter a username"
            return
        }
        
        guard !user.password.isEmpty else {
            isShowingError = true
            errorMessage = "Please enter a password"
            return
        }
        
        let parameters = [
            "username": user.username,
            "password": user.password
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": Constants.contentType
        ]
        
        AF.request(Constants.registerUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: RegisterResponse.self) { response in
                switch response.result {
                case .success(let response):
                    UserDefaults.standard.set(true, forKey: "isRegistered")
                    self.isLoggingIn = true
                    self.isShowingError = false
                    
                    print(response.message)
                    
                case .failure(let error):
                    self.isShowingError = true
                    self.errorMessage = "Failed to register user: \(error.localizedDescription)"
                    self.isLoggingIn = false
                }
            }
    }
    
    func isAuthenticated() -> Bool {
        return UserDefaults.standard.string(forKey: "token") != nil
    }
    
    func fetchProfiles() {
        AF.request(Constants.profileUrl, method: .get)
            .validate() // Validation to automatically check for HTTP errors
            .responseDecodable(of: [Profile].self) { [weak self] response in // Capture list to avoid memory leaks
                switch response.result {
                case .success(let profiles):
                    self?.profiles = profiles
                case .failure(let error):
                    print("Failed to fetch profiles: \(error.localizedDescription)")
                }
            }
    }
    
    func completeProfile () {
        let authToken = UserDefaults.standard.string(forKey: "token") ?? ""
        let headers: HTTPHeaders = [
            "Content-Type": Constants.contentType,
            "Authorization":  "Bearer \(authToken)"
        ]
        
        AF.request(Constants.profileUrl,
                   method: .post,
                   parameters: profile, // Use the `profile` object directly as parameters
                   encoder: JSONParameterEncoder.default, // `JSONParameterEncoder` to encode the `profile` object as JSON
                   headers: headers)
        .validate() // Validation to automatically check for HTTP errors
        .responseDecodable(of: Profile.self) { [weak self] response in
            switch response.result {
            case .success(let profile):
                self?.profile = profile
            case .failure(let error):
                print("Failed to register user: \(error.localizedDescription)")
            }
        }
    }
}
