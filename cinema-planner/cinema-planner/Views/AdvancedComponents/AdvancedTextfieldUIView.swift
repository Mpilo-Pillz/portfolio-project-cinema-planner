//
//  AdvancedTextfieldUIView.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/04/16.
//

import UIKit

class AdvancedTextfieldUIView: UIView {

    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField: UITextField
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorLabel = makeErrorLabel(withText: "Your password must meet the requirements below")
    let placeholderText: String
    let isSecureTextEntry: Bool
    
    init(placeholderText: String, isSecureTextEntry: Bool) {
        self.placeholderText = placeholderText
        self.isSecureTextEntry = isSecureTextEntry
        self.textField = makeTextField(withPlaceholder: self.placeholderText, isSecureTextEntry: self.isSecureTextEntry, autoCapitalizationType: .none)
        super.init(frame: .zero)
        
        styleAdvancedTextfieldUIView()
        layoutAdvancedTextfieldUIView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 20, height: 60)
    }

}



