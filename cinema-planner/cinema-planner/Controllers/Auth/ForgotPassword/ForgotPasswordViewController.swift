//
//  ForgotPasswordViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/04.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    let forgotPasswordBackButton = makeLinkButton(withText: "Back")
    let forgotPasswordStackView = makeStackView(withSpacing: 20, withAxis: .vertical)
    let currentPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Current Password", isSecureTextEntry: false)
    let passwordStatusUIView = PasswordStatusUIView()
    let confirmPasswordTextField = AdvancedTextfieldUIView(placeholderText: "Confrm Password", isSecureTextEntry: false)
    let resetPasswordButton = makePrimaryButton(withText: "Reset Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutForgotPasswordTopScreen()
        styleForgotPasswordViewController()
        layoutForgotPasswordViewController()
        
    }
    

}
