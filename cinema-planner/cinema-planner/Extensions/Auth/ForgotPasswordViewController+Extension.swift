//
//  ForgotPasswordViewController+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/04.
//

import UIKit

extension ForgotPasswordViewController {
    func layoutForgotPasswordViewController() {
        forgotPasswordStackView.addArrangedSubview(currentPasswordTextField)
        
        view.addSubview(forgotPasswordStackView)
        
        NSLayoutConstraint.activate([
            forgotPasswordStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: forgotPasswordStackView.trailingAnchor, multiplier: 2),
            forgotPasswordStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
