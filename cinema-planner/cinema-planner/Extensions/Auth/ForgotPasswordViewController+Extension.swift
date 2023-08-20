//
//  ForgotPasswordViewController+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/04.
//

import UIKit

extension ForgotPasswordViewController {
    
    func layoutForgotPasswordTopScreen() {
        view.addSubview(forgotPasswordBackButton)
        
        NSLayoutConstraint.activate([
            forgotPasswordBackButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            forgotPasswordBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2)
        ])
    }
    func layoutForgotPasswordViewController() {
        forgotPasswordStackView.addArrangedSubview(currentPasswordTextField)
        forgotPasswordStackView.addArrangedSubview(passwordStatusUIView)
        forgotPasswordStackView.addArrangedSubview(confirmPasswordTextField)
        forgotPasswordStackView.addArrangedSubview(resetPasswordButton)
        
        view.addSubview(forgotPasswordStackView)
        
        forgotPasswordBackButton.addTarget(self, action: #selector(forgotPasswordBackButtonTapped), for: .primaryActionTriggered)
        
        NSLayoutConstraint.activate([
            forgotPasswordStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: forgotPasswordStackView.trailingAnchor, multiplier: 2),
            forgotPasswordStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func styleForgotPasswordViewController() {
        passwordStatusUIView.translatesAutoresizingMaskIntoConstraints = false
        passwordStatusUIView.layer.cornerRadius = 5
        passwordStatusUIView.clipsToBounds = true
    }
    

}

// MARK: - AdvancedTextFielDelegate
extension ForgotPasswordViewController {
    func editingChanged(_ sender: AdvancedTextfieldUIView) {
        if sender === currentPasswordTextField {
            passwordStatusUIView.updateDisplay(sender.textField.text ?? "")
        }
    }
}
// MARK: - Actions Forgot PAssword Back Button tapped
extension ForgotPasswordViewController {
    @objc func forgotPasswordBackButtonTapped(_ sender: Any) {
        print("tapped")
        delegate?.didGoBackToLogin()
    }
}
