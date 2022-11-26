//
//  StackViewFactory.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/26.
//

import UIKit

func makeStackView(withSpacing spacing: CGFloat, withAxis direction: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = direction
    stackView.spacing = spacing
    
    return stackView
}
