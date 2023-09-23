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

class ForgotPasswordViewController: UIViewController, AdvancedTextFielDelegate {
    
    weak var delegate: ForgotPasswordViewControllerDelegate?
    let forgotPasswordBackButton = makeLinkButton(withText: "Back")
    let forgotPasswordStackView = makeStackView(withSpacing: 20, withAxis: .vertical)
    let currentPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Current Password", isSecureTextEntry: false)
    let passwordStatusUIView = PasswordStatusUIView()
    let confirmPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Confrm Password", isSecureTextEntry: false)
    let resetPasswordButton = makePrimaryButton(withText: "Reset Password")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assining the currwnt password textfield delegate to self
        currentPasswordTextField.delegate = self // this was not the delegate fo the textfield it was of the class
        currentPasswordTextField.textField.delegate = self
        
        currentPasswordTextField.textField.tag = 1
//        setup()
        layoutForgotPasswordTopScreen()
        styleForgotPasswordViewController()
        layoutForgotPasswordViewController()
            
    }
    

}

// MARK: - UITextFieldDelegate, Gontse
extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Ola Gontse, this is supposed to run when I click outside the textfield\(textField.text ?? "")")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Ola Gontse, this should run when I click enter: \(textField.text ?? "")")
        switch textField.tag {
        case 1:
            //            TODO: add logic
            return false
        default: return false
        }
    }
}
