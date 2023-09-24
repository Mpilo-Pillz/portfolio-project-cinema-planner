//
//  AdvancedTextfieldUIView+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/04/16.
//

import UIKit

extension AdvancedTextfieldUIView {
    func styleAdvancedTextfieldUIView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = false // true
        textField.placeholder = placeholderText
        
        textField.keyboardType = .asciiCapable // preventing what the user can enter, eg emojies
        textField.attributedPlaceholder = NSAttributedString(string:placeholderText,
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]) // text color of placeholder
        
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        //        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        //        errorLabel.textColor = .systemRed
        errorLabel.font = .preferredFont(forTextStyle: .footnote)
        //
        errorLabel.text = "Your password must meet the requirements below" // requirements below will go down to a new line so there are no orphan words
        errorLabel.isHidden = true
        
        
        //        Going multiline
        //        We can make a label multiline like this:
        errorLabel.numberOfLines = 0
        errorLabel.lineBreakMode = .byWordWrapping // prevents orphan words by default
    }
    
    func layoutAdvancedTextfieldUIView() {
        addSubview(lockImageView)
        addSubview(textField)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorLabel)
        
        // lock
        NSLayoutConstraint.activate([
            lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
        // textfield
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1),
        ])
        
        // eye
        NSLayoutConstraint.activate([
            eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // divider
        NSLayoutConstraint.activate([
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1)
        ])
        
        // error
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 4),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
        
        // CHCR
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal) // lock image view i need you to hug yourself and i dont want you to tretch
        textField.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal) // text field I need you to stretch
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal) // eye button i need your content hugging to be high, I also need you to hug your self and not streych
        
    }
    
}

// MARK: - Valiation
extension AdvancedTextfieldUIView {
    func validate() -> Bool {
        if let customValidation = customValidation,
        let customValidationResult = customValidation(text),
           customValidationResult.0 == false {
            showError(customValidationResult.1)
            return false
        }
        clearError()
        return true
    }
    
    private func showError(_ errorMessage: String) {
        errorLabel.isHidden = false
        errorLabel.text = errorMessage
    }
    
    private func clearError() {
        errorLabel.isHidden = true
        errorLabel.text = ""
    }
}

// The actions below are needed to add a target to actually add actions to the fields
// MARK: - Actions Toggle Password View
extension AdvancedTextfieldUIView {
    @objc func togglePasswordView(_ sender: Any) {
        textField.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}

// MARK: - UITextFieldDelegate
extension AdvancedTextfieldUIView: UITextFieldDelegate {
    @objc func textFieldEditingChanged(_ sender: UITextField) {
        delegate?.editingChanged(self)
    }
    
    func textFieldDidEndEditing() {
        delegate?.editingDidEnd(self)
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("Ola , this is supposed to run when I click outside the textfield\(textField.text ?? "")")
//    }
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("Ola , this should run when I click enter: \(textField.text ?? "")")
//        switch textField.tag {
//        case 1:
//            //            TODO: add logic
//            return false
//        default: return false
//        }
//    }
}
