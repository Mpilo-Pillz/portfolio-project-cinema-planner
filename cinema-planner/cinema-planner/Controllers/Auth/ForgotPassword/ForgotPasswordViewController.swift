//
//  ForgotPasswordViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/04.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    let forgotPasswordStackView = makeStackView(withSpacing: 20, withAxis: .vertical)
    let currentPasswordTextField = makeTextField(withPlaceholder: "Current Password", isSecureTextEntry: false)
    let passwordStatusUIView = PasswordStatusUIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleForgotPasswordViewController()
        layoutForgotPasswordViewController()
        
    }
    

}
