//
//  LoginView+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/26.
//

import UIKit

// MARK: - UITextFieldDelegate, Gontse
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Ola Gontse, this also does not run")
        loginViewUsernameTextField.endEditing(true)
        loginViewPasswordTextField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Ola Gontse, neither does this run")
        return true
    }
    
}
