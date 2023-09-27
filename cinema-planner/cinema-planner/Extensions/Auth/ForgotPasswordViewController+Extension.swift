//
//  ForgotPasswordViewController+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/04.
//

import UIKit

extension ForgotPasswordViewController {
    
    func setUpForgotPasswordViewController() {
        setUpNewPasswordTextField()
        setupConfirmPassword()
        setupDissmissKeyboardGesture()
        setupKeyboardHiding()
    }
    

    private func setUpNewPasswordTextField() {
        let newPasswordValidation: CustomValidation = { text in
            guard let text = text, !text.isEmpty else {
//                self.passwordStatusUIView.reset()
                return (false, "Enter your password")
            }
            
            let validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,@:?!()$\\/#"
            let invalidSet = CharacterSet(charactersIn: validChars).inverted
            
            guard text.rangeOfCharacter(from: invalidSet) == nil else {
//                self.passwordStatusUIView.reset()
                return (false, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
            }
            
            // Criteria met
            self.passwordStatusUIView.updateDisplay(text)
//            if !self.passwordStatusUIView.validate(text) {
//                return (false, "Your password must meet the requirements below")
//            }
            
            return (true, "")
        }       
        newPasswordTextField.customValidation = newPasswordValidation
        newPasswordTextField.delegate = self
    }
    
    private func setupConfirmPassword() {
        let confirmPasswordValidation: CustomValidation = { text in
            guard let text = text, !text.isEmpty else {
                return (false, "Enter your password.")
            }
            guard text == self.newPasswordTextField.text else {
                return (false, "Passwords do not match.")
            }
            return (true, "")
        }
        confirmPasswordTextField.customValidation = confirmPasswordValidation
        confirmPasswordTextField.delegate = self
    }
    
    private func setupDissmissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(ViewTapped(_:)))
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc func ViewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func layoutForgotPasswordTopScreen() {
        view.addSubview(forgotPasswordBackButton)
        
        NSLayoutConstraint.activate([
            forgotPasswordBackButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            forgotPasswordBackButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2)
        ])
    }
    func layoutForgotPasswordViewController() {
        forgotPasswordStackView.addArrangedSubview(newPasswordTextField)
        forgotPasswordStackView.addArrangedSubview(passwordStatusUIView)
        forgotPasswordStackView.addArrangedSubview(confirmPasswordTextField)
        forgotPasswordStackView.addArrangedSubview(resetPasswordButton)
        
        view.addSubview(forgotPasswordStackView)
        
        forgotPasswordBackButton.addTarget(self, action: #selector(forgotPasswordBackButtonTapped), for: .primaryActionTriggered)
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .primaryActionTriggered)
        
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

//MARK: - Actions
extension ForgotPasswordViewController {
    @objc func resetPasswordButtonTapped(sender: UIButton) {
        view.endEditing(true)
        
        let isValidNewPassword = newPasswordTextField.validate()
        let isValidConfirmPassword = confirmPasswordTextField.validate()
        
        if isValidNewPassword && isValidConfirmPassword {
            showAlert(title: "Success", message: "Ready to make call to api")
        }
    }
    
    private func showAlert(title: String, message: String) {
            let alert =  UIAlertController(title: "", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            alert.title = title
            alert.message = message
            present(alert, animated: true, completion: nil)
        }
}

// MARK: - UITextFieldDelegate
extension ForgotPasswordViewController: AdvancedTextFieldDelegate {
    func editingDidEnd(_ sender: AdvancedTextfieldUIView) {
        if sender === newPasswordTextField {
            passwordStatusUIView.shouldResetCriteria = false
            _ = newPasswordTextField.validate()
        }
    }
}

// MARK: - AdvancedTextFielDelegate
extension ForgotPasswordViewController {
    func editingChanged(_ sender: AdvancedTextfieldUIView) {
        if sender === newPasswordTextField {
            passwordStatusUIView.updateDisplay(sender.textField.text ?? "")
        } else if sender == confirmPasswordTextField {
            _ = confirmPasswordTextField.validate()
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

// MARK: - Keyboard
extension ForgotPasswordViewController {
    @objc func keyboardWillShow(sender: NSNotification) {
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        
        // convert one coordinate system to another
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        

        // if textField bottom is below keyboard bottom - bump the frame up
        if textFieldBottomY > keyboardTopY {
            // adjust view up
            let textBoxY = convertedTextFieldFrame.origin.y
                let newFrameY = (textBoxY - keyboardTopY / 2) * -1
                view.frame.origin.y = newFrameY
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}
