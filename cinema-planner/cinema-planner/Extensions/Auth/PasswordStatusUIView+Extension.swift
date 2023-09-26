//
//  PasswordStatusUIView+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/18.
//

import UIKit

extension PasswordStatusUIView {
    
    func validate(_ text: String) -> Bool {
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)
        
        let checkable = [uppercaseMet, lowercaseMet, digitMet, specialCharacterMet]
        
//        _ = checkable.filter { (criteria: Bool) -> Bool in return criteria }
        let metCriteria = checkable.filter { $0 }
        
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        
        if lengthAndNoSpaceMet && metCriteria.count >= 3 {
            return true
        }
        return false
    }
    
    func stylePasswordStatusUIView() {
        backgroundColor = .tertiarySystemFill
        
        criteriaLabel.numberOfLines = 0
        criteriaLabel.lineBreakMode = .byWordWrapping
        criteriaLabel.attributedText = makeCriteriaMessage()
        
        lengthCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        uppercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        lowercaseCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        digitCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        specialCharacterCriteriaView.translatesAutoresizingMaskIntoConstraints = false
        
        passwordStatusStackView.distribution = .equalCentering
    }
    
    func passwordStatusUIViewLayout() {
        
        
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
   
}

// MARK: - Make Criteria
extension PasswordStatusUIView {
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
