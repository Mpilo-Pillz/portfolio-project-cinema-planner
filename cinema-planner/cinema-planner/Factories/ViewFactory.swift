//
//  ViewFactory.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/01/15.
//

import UIKit

func makeUIView(withWidth width: Int, withHeight height:Int) -> UIView {
    let uiView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    
    uiView.translatesAutoresizingMaskIntoConstraints = false
    
    let gradient = CAGradientLayer()
    
    gradient.frame = uiView.bounds
    gradient.colors = [UIColor.gradientLightGrey.cgColor, UIColor.gradientDarkGrey.cgColor]
    
    uiView.layer.insertSublayer(gradient, at: 0)
    
    return uiView
}
