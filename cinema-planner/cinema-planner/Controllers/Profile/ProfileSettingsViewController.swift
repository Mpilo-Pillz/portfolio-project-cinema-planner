//
//  ProfileSettingsViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/01/29.
//

import UIKit

class ProfileSettingsViewController: UIViewController {
    
    let margin: CGFloat = 20
    let spacing: CGFloat = 32
    
    let darkModeSubLabel = makeSubLabel(withText: "Toggle between light and dark mode")
    let darkModeLabel = makeLabel(withText: "Switch to Dark Mode", alignment: .left, forTextStyle: .body, alpha: 1)
    let darkModeToggle = makeSwitch(isOn: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupViews()
        setupContraints()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Your Profile Settings"
    }
    
    func setupViews() {
        view.addSubview(darkModeSubLabel)
        view.addSubview(darkModeLabel)
        view.addSubview(darkModeToggle)
    }
    
    func setupContraints() {
        NSLayoutConstraint.activate([
            darkModeSubLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            darkModeSubLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            darkModeLabel.topAnchor.constraint(equalTo: darkModeSubLabel.topAnchor, constant: margin * 2),
            darkModeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacing),
        ])
        
        NSLayoutConstraint.activate([
            darkModeToggle.centerYAnchor.constraint(equalTo: darkModeLabel.centerYAnchor ),
            darkModeToggle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -spacing)
        ])
    }
}
