//
//  PasswordStatusUIView.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/18.
//

import UIKit

class PasswordStatusUIView: UIView {
    let passwordStatusStackView = makeStackView(withSpacing: 8, withAxis: .vertical)
    
    let criteriaLabel = UILabel() // TODO: Use Dependency Inversion of Control
    
    let lengthCriteriaView = PasswordCriteriaUIView(text: "8-32 characters (no spaces)")
    let uppercaseCriteriaView = PasswordCriteriaUIView(text: "uppercase letter (A-Z)")
    let lowercaseCriteriaView = PasswordCriteriaUIView(text: "lowercase (a-z)")
    let digitCriteriaView = PasswordCriteriaUIView(text: "digit (0-9)")
    let specialCharacterCriteriaView = PasswordCriteriaUIView(text: "special character (e.g. !@#$%^)")
    
    var shouldResetCriteria: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stylePasswordStatusUIView()
        passwordStatusUIViewLayout()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

// MARK: - Update Display
extension PasswordStatusUIView {
    func updateDisplay(_ text: String) {
        let lengthAndNoSpaceMet = PasswordCriteria.lengthAndNoSpaceMet(text)
        let uppercaseMet = PasswordCriteria.uppercaseMet(text)
        let lowercaseMet = PasswordCriteria.lowercaseMet(text)
        let digitMet = PasswordCriteria.digitMet(text)
        let specialCharacterMet = PasswordCriteria.specialCharacterMet(text)
        
        print("should reset \(shouldResetCriteria)")
        if shouldResetCriteria {
            //            Inline validation (✅ or ⚪️)
            lengthAndNoSpaceMet ? lengthCriteriaView.isCriteriaMet = true : lengthCriteriaView.reset()
            uppercaseMet ? uppercaseCriteriaView.isCriteriaMet = true : uppercaseCriteriaView.reset()
            lowercaseMet ? lowercaseCriteriaView.isCriteriaMet = true : lowercaseCriteriaView.reset()
            digitMet ? digitCriteriaView.isCriteriaMet = true : digitCriteriaView.reset()
            specialCharacterMet ? specialCharacterCriteriaView.isCriteriaMet = true : specialCharacterCriteriaView.reset()
        } else {
            // Focus lost (✅ or ❌)
            lengthCriteriaView.isCriteriaMet = lengthAndNoSpaceMet
            uppercaseCriteriaView.isCriteriaMet = uppercaseMet
            lowercaseCriteriaView.isCriteriaMet = lowercaseMet
            digitCriteriaView.isCriteriaMet = digitMet
            specialCharacterCriteriaView.isCriteriaMet = specialCharacterMet
        }
        
    }
    
    func reset() {
        lengthCriteriaView.reset()
        uppercaseCriteriaView.reset()
        lowercaseCriteriaView.reset()
        digitCriteriaView.reset()
        specialCharacterCriteriaView.reset()
    }
}
