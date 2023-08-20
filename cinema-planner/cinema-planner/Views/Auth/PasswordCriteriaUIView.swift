//
//  PasswordCriteriaUIView.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/03/18.
//

import UIKit

class PasswordCriteriaUIView: UIView {
    
    let passwordCriteriaStackView = makeStackView(withSpacing: 8, withAxis: .horizontal)
    let passwordCriteriaImageView = UIImageView()
    let passwordCriteriaLabel = UILabel()
    
    let checkmarkImage = UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
    let xmarkImage = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
    let circleImage = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)
    
    var isCriteriaMet: Bool = false {
        didSet {
            if isCriteriaMet {
                passwordCriteriaImageView.image = checkmarkImage
            } else {
                passwordCriteriaImageView.image = xmarkImage
            }
        }
    }
    
    func reset() {
        isCriteriaMet = false
        passwordCriteriaImageView.image = circleImage
    }
    init(text: String) {
        super.init(frame: .zero)
        
        passwordCriteriaLabel.text = text
        
        passwordCriteriaViewStyle()
        passwordCriteriaViewLayout()

    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
}
