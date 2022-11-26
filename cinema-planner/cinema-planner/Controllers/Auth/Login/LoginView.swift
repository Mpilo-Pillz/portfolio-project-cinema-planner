//
//  LoginView.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/26.
//

import UIKit

class LoginView: UIView {
    
    let loginViewStackView = makeStackView(withSpacing: 8, withAxis: .vertical)
    let loginViewUsernameTextField = makeTextField(withPlaceholder: "Username", isSecureTextEntry: false)
    let loginViewPasswordTextField = makeTextField(withPlaceholder: "Password", isSecureTextEntry: true)
    let LoginViewDividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        styleLoginView()
        layoutLoginView()
        setupLoginViewConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    private func styleLoginView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
    }
    
    private func layoutLoginView() {
        loginViewStackView.addArrangedSubview(loginViewUsernameTextField)
        loginViewStackView.addArrangedSubview(LoginViewDividerView)
        loginViewStackView.addArrangedSubview(loginViewPasswordTextField)
    }
    
    private func setupLoginViewConstraints() {
        
    }
}

