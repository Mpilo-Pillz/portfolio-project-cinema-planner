//
//  UserManager.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/12/02.
//

import Foundation

protocol UserManageable: AnyObject {
    func login(withEmail email: String, withPassword password: String, completion: @escaping(Result<User, NetworkError>) -> Void)
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
    
}
