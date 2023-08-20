//
//  TextFieldFactory.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/26.
//

import UIKit

func makeTextField(withPlaceholder placeholder: String, isSecureTextEntry: Bool, autoCapitalizationType: UITextAutocapitalizationType) -> UITextField {
    let textField = UITextField()
    
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.placeholder = placeholder
    textField.isSecureTextEntry = isSecureTextEntry
    textField.autocapitalizationType = autoCapitalizationType
    
    return textField
}
