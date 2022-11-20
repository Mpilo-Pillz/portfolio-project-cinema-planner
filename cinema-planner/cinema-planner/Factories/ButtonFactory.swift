//
//  ButtonFactory.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import UIKit

func makeButton(withText text: String, withButtonType buttontype: UIControl.State) -> UIButton {
    
    let button = UIButton()
    button.setTitle(text, for: buttontype)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
}
