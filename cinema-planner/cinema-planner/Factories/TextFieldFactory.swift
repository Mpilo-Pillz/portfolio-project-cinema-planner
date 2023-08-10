//
//  TextFieldFactory.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/26.
//

import UIKit

func makeTextField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) -> UITextField {
    let textField = UITextField()
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeholder
    textField.isSecureTextEntry = isSecureTextEntry
    textField.autocapitalizationType = .none
    
    return textField
}
