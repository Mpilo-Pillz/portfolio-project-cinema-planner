//
//  LabelFactory.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/25.
//

import UIKit

func makeLabel(withText text:String, alignment: NSTextAlignment, forTextStyle: UIFont.TextStyle, alpha: CGFloat) -> UILabel {
    let label = UILabel()
    
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = alignment
    label.font = UIFont.preferredFont(forTextStyle: forTextStyle)
    label.adjustsFontForContentSizeCategory = true
    label.text = text
    label.numberOfLines = 0
    
    label.alpha = alpha
    
    return label
}

func makeErrorLabel(withText text:String) -> UILabel {
    let errorLabel = UILabel()
    
    errorLabel.translatesAutoresizingMaskIntoConstraints = false
    errorLabel.textAlignment = .center
    errorLabel.textColor = .systemRed
    errorLabel.numberOfLines = 0
    errorLabel.text = text
    errorLabel.isHidden = true
    
    return errorLabel
}

func makeSubLabel(withText text: String) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .gray
    label.text = text
    label.font = UIFont.systemFont(ofSize: 13)
    label.numberOfLines = 0
    
    return label
}




