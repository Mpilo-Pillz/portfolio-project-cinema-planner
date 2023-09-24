//
//  AdvancedTextfieldUIView.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/04/16.
//

import UIKit

class AdvancedTextfieldUIView: UIView {

    typealias CustomValidation = (_ textValue: String?) -> (Bool, String)?
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textField: UITextField
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorLabel = makeErrorLabel(withText: "Your password must meet the requirements below")
    let placeholderText: String
    let isSecureTextEntry: Bool
    var customValidation: CustomValidation?
    
    var text: String? {
        get {return textField.text}
        set { textField.text = newValue }
    }
    weak var delegate: AdvancedTextFieldDelegate?
    
    init(placeholderText: String, isSecureTextEntry: Bool) {
        self.placeholderText = placeholderText
        self.isSecureTextEntry = isSecureTextEntry
        self.textField = makeTextField(withPlaceholder: self.placeholderText, isSecureTextEntry: self.isSecureTextEntry, autoCapitalizationType: .none)
        // textField.tag = 1 //TODO: add enum
        super.init(frame: .zero)
        // textField.delegate = self 
        
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





