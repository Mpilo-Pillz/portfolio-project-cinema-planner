//
//  ProfileSettingsViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/01/29.
//

import UIKit



protocol ProfileSettingsViewControllerDelegate: AnyObject {
    func didLogout()
}

class ProfileSettingsViewController: UIViewController {
    weak var delegate: ProfileSettingsViewControllerDelegate?
    
    let margin: CGFloat = 20
    let spacing: CGFloat = 32
    
    let darkModeSubLabel = makeSubLabel(withText: "Toggle between light and dark mode")
    let darkModeLabel = makeLabel(withText: "Switch to Dark Mode", alignment: .left, forTextStyle: .body, alpha: 1)
    let darkModeToggle = makeSwitch(isOn: false)
    
    let logoutButton = makeLinkButton(withText: "Logout")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationBar()
        setupViews()
        setupContraints()
        darkModeToggle.addTarget(self, action: #selector(onSwitchStateDidChange), for: .valueChanged)
        logoutButton.addTarget(self, action: #selector(logoutTapped), for: .primaryActionTriggered)
        
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Your Profile Settings"
    }
    
    func setupViews() {
        view.addSubview(darkModeSubLabel)
        view.addSubview(darkModeLabel)
        view.addSubview(darkModeToggle)
        view.addSubview(logoutButton)
    }
    
   func logout() {
        delegate?.didLogout()
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
        
        NSLayoutConstraint.activate([
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10)
        ])
    }
    
    @objc func onSwitchStateDidChange(_ sender: UISwitch) {
        //                let appDelegate = UIApplication.shared.windows.first // deprecated
        
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication
                .shared
                .connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                .first
            
            appDelegate?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
            return
        }
        print("This feature is only supported in iOS 13 upwards")
        
    }  
}
