//
//  ButtonFactory.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import UIKit

func makeSecondaryButton(withText text: String, withButtonType buttontype: UIControl.State) -> UIButton {
    
    let secondaryButton = UIButton()
    secondaryButton.setTitle(text, for: buttontype)
    secondaryButton.layer.borderColor = UIColor.white.cgColor
    secondaryButton.layer.borderWidth = 1
    secondaryButton.layer.cornerRadius = 5
    secondaryButton.translatesAutoresizingMaskIntoConstraints = false
    
    return secondaryButton
}

func makePrimaryButton(withText text: String) -> UIButton {
    let primaryButton = UIButton(type: .system)
    
    primaryButton.translatesAutoresizingMaskIntoConstraints = false
    primaryButton.configuration = .filled()
    primaryButton.configuration?.imagePadding = 8
    primaryButton.setTitle(text, for: [])
    
    return primaryButton
    
}

func makeLinkButton(withText text: String) -> UIButton {
    let linkButton = UIButton(type: .system)
    
    linkButton.translatesAutoresizingMaskIntoConstraints = false
    linkButton.setTitle(text, for: [])
    
    return linkButton
}

func makeSwitch(isOn: Bool) -> UISwitch {
    let uiSwitch = UISwitch()
    uiSwitch.translatesAutoresizingMaskIntoConstraints = false
    uiSwitch.isOn = isOn
    
    return uiSwitch
}
