//
//  PasswordStatusUIView.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/18.
//

import UIKit

class PasswordStatusUIView: UIView {
let passwordStatusStackView = makeStackView(withSpacing: 8, withAxis: .vertical)
    
    let criteriaLabel = UILabel()
    
    let lengthCriteriaView = PasswordCriteriaUIView(text: "8-32 characters (no spaces)")
    let uppercaseCriteriaView = PasswordCriteriaUIView(text: "uppercase letter (A-Z)")
    let lowercaseCriteriaView = PasswordCriteriaUIView(text: "lowercase (a-z)")
    let specialCharacterCriteriaView = PasswordCriteriaUIView(text: "special character (e.g. !@#$%^)")
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
    
   

}
