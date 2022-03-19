//
//  PasswordStatusUIView+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/18.
//

import UIKit

extension PasswordStatusUIView {
    
    func stylePasswordStatusUIView() {
        
        criteriaLabel.numberOfLines = 0
        criteriaLabel.lineBreakMode = .byWordWrapping
        criteriaLabel.attributedText = makeCriteriaMessage()
        
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func passwordStatusUIViewLayout() {
        passwordStatusStackView.distribution = .equalCentering
        
        passwordStatusStackView.addArrangedSubview(lengthCriteriaView)
        passwordStatusStackView.addArrangedSubview(criteriaLabel)
        passwordStatusStackView.addArrangedSubview(uppercaseCriteriaView)
        passwordStatusStackView.addArrangedSubview(lowercaseCriteriaView)
        passwordStatusStackView.addArrangedSubview(digitCriteriaView)
        passwordStatusStackView.addArrangedSubview(specialCharacterCriteriaView)
        addSubview(passwordStatusStackView)
        
        NSLayoutConstraint.activate([
            passwordStatusStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            passwordStatusStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: passwordStatusStackView.trailingAnchor, multiplier: 2),
            bottomAnchor.constraint(equalToSystemSpacingBelow: passwordStatusStackView.bottomAnchor, multiplier: 2)
        ])
    }
    private func makeCriteriaMessage() -> NSAttributedString {
        var plainTextAttributes = [NSAttributedString.Key: AnyObject]()
        plainTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)
        plainTextAttributes[.foregroundColor] = UIColor.secondaryLabel
        
        var boldTextAttributes = [NSAttributedString.Key: AnyObject]()
        boldTextAttributes[.foregroundColor] = UIColor.label
        boldTextAttributes[.font] = UIFont.preferredFont(forTextStyle: .subheadline)

        let attrText = NSMutableAttributedString(string: "Use at least ", attributes: plainTextAttributes)
        attrText.append(NSAttributedString(string: "3 of these 4 ", attributes: boldTextAttributes))
        attrText.append(NSAttributedString(string: "criteria when setting your password:", attributes: plainTextAttributes))

        return attrText
    }
}
