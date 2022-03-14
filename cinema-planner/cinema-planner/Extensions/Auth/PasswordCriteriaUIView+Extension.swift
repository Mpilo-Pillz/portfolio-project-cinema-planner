//
//  PasswordCriteriaUIView+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/18.
//

import UIKit

extension PasswordCriteriaUIView {
    func passwordCriteriaViewStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        
        passwordCriteriaImageView.translatesAutoresizingMaskIntoConstraints = false
        passwordCriteriaImageView.image = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
        
        passwordCriteriaLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordCriteriaLabel.font = .preferredFont(forTextStyle: .subheadline)
        passwordCriteriaLabel.textColor = .secondaryLabel
    }
    
    func passwordCriteriaViewLayout() {
        passwordCriteriaStackView.addArrangedSubview(passwordCriteriaImageView)
        passwordCriteriaStackView.addArrangedSubview(passwordCriteriaLabel)
        
        addSubview(passwordCriteriaStackView)
        
        NSLayoutConstraint.activate([
            passwordCriteriaStackView.topAnchor.constraint(equalTo: topAnchor),
            passwordCriteriaStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            passwordCriteriaStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            passwordCriteriaStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            passwordCriteriaImageView.heightAnchor.constraint(equalTo: passwordCriteriaImageView.widthAnchor),
            
                    ])
        
        //CHCR
        passwordCriteriaImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        passwordCriteriaLabel.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)

    }
}
