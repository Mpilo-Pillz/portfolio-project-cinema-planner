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
        
        currentPasswordTextField.delegate = self
        
        layoutForgotPasswordTopScreen()
        styleForgotPasswordViewController()
        layoutForgotPasswordViewController()
            
    }
    

}
