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

//protocol AdvancedTextFieldDelegate: AnyObject {
//    func editingChanged(_ sender: AdvancedTextfieldUIView)
//    func editingDidEnd(_ sender: AdvancedTextfieldUIView)
//}

class ForgotPasswordViewController: UIViewController {
   
    weak var delegate: ForgotPasswordViewControllerDelegate?
    let forgotPasswordBackButton = makeLinkButton(withText: "Back")
    let forgotPasswordStackView = makeStackView(withSpacing: 20, withAxis: .vertical)
    let currentPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Current Password", isSecureTextEntry: false)
    let passwordStatusUIView = PasswordStatusUIView()
    let confirmPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Confrm Password", isSecureTextEntry: false)
    let resetPasswordButton = makePrimaryButton(withText: "Reset Password")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPasswordTextField.delegate = self // this was not the delegate fo the textfield it was of the class
        // Assining the currwnt password textfield delegate to self
        currentPasswordTextField.textField.delegate = self
        
//        currentPasswordTextField.textField.tag = 1
//        setup()
        layoutForgotPasswordTopScreen()
        styleForgotPasswordViewController()
        layoutForgotPasswordViewController()
            
    }
    

}

// MARK: - UITextFieldDelegate
extension ForgotPasswordViewController: AdvancedTextFieldDelegate {
g
    
}

// MARK: - UITextFieldDelegate
// TODO see what happens when I move this back to the AdvancedTextFieldUIVIew Child class
extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
//        delegate?.editingDidEnd(textField)
//        delegate?.editingDidEnd(self)
        currentPasswordTextField.textFieldDidEndEditing()
//        print("Delegate---->\(delegate)")
        print(" this is supposed to run when I click outside the textfield\(textField.text ?? "")")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true) // Resign first responder
        return true
    }
}
