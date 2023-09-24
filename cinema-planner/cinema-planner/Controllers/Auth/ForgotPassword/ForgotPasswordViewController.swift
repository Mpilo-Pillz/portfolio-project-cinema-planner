//
//  ForgotPasswordViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/04.
//

import UIKit

protocol ForgotPasswordViewControllerDelegate: AnyObject {
    func didGoBackToLogin()
}

class ForgotPasswordViewController: UIViewController {
    
    typealias CustomValidation = AdvancedTextfieldUIView.CustomValidation
    weak var delegate: ForgotPasswordViewControllerDelegate?
    let forgotPasswordBackButton = makeLinkButton(withText: "Back")
    let forgotPasswordStackView = makeStackView(withSpacing: 20, withAxis: .vertical)
    let newPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Current Password", isSecureTextEntry: false)
    let passwordStatusUIView = PasswordStatusUIView()
    let confirmPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Confrm Password", isSecureTextEntry: false)
    let resetPasswordButton = makePrimaryButton(withText: "Reset Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPasswordTextField.delegate = self // this was not the delegate fo the textfield it was of the class
        // Assining the currwnt password textfield delegate to self
        newPasswordTextField.textField.delegate = self
        
        //        currentPasswordTextField.textField.tag = 1
        setUpForgotPasswordViewController()
        layoutForgotPasswordTopScreen()
        styleForgotPasswordViewController()
        layoutForgotPasswordViewController()
    }
    
}



// MARK: - UITextFieldDelegate
extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        //        delegate?.editingDidEnd(self)
        newPasswordTextField.textFieldDidEndEditing()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true) // Resign first responder
        return true
    }
}
