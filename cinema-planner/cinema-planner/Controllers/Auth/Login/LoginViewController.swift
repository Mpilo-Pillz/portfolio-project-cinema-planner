//
//  LoginViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/26.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    var userManager: UserManageable = UserManager()
    
    let titleLabel = makeLable(withText: "Cinema Planner", alignment: .center, forTextStyle: .largeTitle)
    let subTitleLabel = makeLable(withText: "Never miss a movie premier again!", alignment: .center, forTextStyle: .title3)
    
    let loginView = LoginView()
    var signInButton = makePrimaryButton(withText: "Sign In")
    let errorMessageLabel = makeErrorLabel(withText: "")
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.loginViewUsernameTextField.text
    }
    
    var password: String? {
        return loginView.loginViewPasswordTextField.text
    }
    
    var leadingEdgeOnScreen: CGFloat = 16
    var leadingEdgeOffScreen: CGFloat = -1000
    
    var titleLeadingAnchor: NSLayoutConstraint?
    var subtitleLeadingAnchor: NSLayoutConstraint?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
}
