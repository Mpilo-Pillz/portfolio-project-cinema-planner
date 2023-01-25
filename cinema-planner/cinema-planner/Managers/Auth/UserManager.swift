//
//  UserManager.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/12/02.
//

import Foundation

protocol UserManageable: AnyObject {
    func login(withEmail email: String, withPassword password: String, completion: @escaping(Result<LoginResponse, NetworkError>) -> Void)
}

struct LoginResponse: Codable {
    let isAuthenticated: Bool
    let message: String?
    let accessToken: String?
    let user: String
    let userId: String
    
}

enum NetworkError: Error {
    case serverError
    case decodingError
}

struct User: Codable {
    let email: String
    let password: String
}

class UserManager: UserManageable {
    func login(withEmail email: String, withPassword password: String, completion: @escaping (Result<LoginResponse, NetworkError>) -> Void) {
        print("in the user")
        guard let url = URL(string: "\(Constants.apiBaseURL)/api/v1/auth/login") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyData = try? JSONSerialization.data(withJSONObject: [
            "email": email,
            "password": password
        ], options: .fragmentsAllowed)
        
        request.httpBody = bodyData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(.success(response))
                    guard let accessToken = response.accessToken else {
                        return
                    }
                    let auth = AuthManager(accessToken: accessToken)
                    let service = "accessToken"
                    let account = "backend"
                    KeychainHelper.keychainHelper.save(auth, service: service, account: account)
                    print("user: \(response)")
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }
        task.resume()
    }
}
