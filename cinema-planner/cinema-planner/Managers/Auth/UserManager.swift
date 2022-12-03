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
    let message: String
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
        guard let url = URL(string: "\(Constants.localbaseURL)/api/v1/auth/login") else {
            return
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyData = try? JSONSerialization.data(withJSONObject: [
            "email": "thulani@karabo.co.za",
            "password": "Thapelo"
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
                    print("user: \(response)")
                } catch {
                    completion(.failure(.decodingError))
                    
                }
            }
        }
            task.resume()
    }
}


//class UserManager: UserManageable {
//    func login(withEmail email: String, withPassword password: String, completion: @escaping (Result<User, NetworkError>) -> Void) {
//        print("in the user")
//        guard let url = URL(string: "\(Constants.localbaseURL)/api/v1/auth/login") else {
//            return
//        }
//
//        var request = URLRequest(url: url)
//
//        let bodyData = try? JSONSerialization.data(withJSONObject: [
//            "email": "thulani@karabo.co.za",
//        "password": "Thapelo"
//        ])
//
//        request.httpMethod = "POST"
//        request.httpBody = bodyData
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            DispatchQueue.main.async {
//                guard let data = data, error == nil else {
//                    return
//                }
//
//                do {
//                    let user = try JSONDecoder().decode(User.self, from: data)
//                    completion(.success(user))
//                    print("user: \(user)")
//                } catch {
//                    completion(.failure(.decodingError))
//
//                }
//            }
//        }.resume()
//    }
//}
