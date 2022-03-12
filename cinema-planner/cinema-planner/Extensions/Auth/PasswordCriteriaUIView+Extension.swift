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
}
