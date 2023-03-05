//
//  SceneDelegate.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UITabBarControllerDelegate {
    
    var window: UIWindow?
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainTabBarViewController = MainTabBarViewController()
    let loginViewController = LoginViewController()
    let forgotPasswordViewController = ForgotPasswordViewController()
    let homeViewController = HomeViewController()
    let profileSettingsViewController = ProfileSettingsViewController()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        LocalState.hasMadeTitleBarScrollable = false
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.backgroundColor = .systemBackground
        window?.rootViewController = onboardingContainerViewController
        window?.makeKeyAndVisible()
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        profileSettingsViewController.delegate = self
        
//        displayScreenBasedOnOnboardingStatus()
        displayViewBasedOnAuthStatus()
        
    }
    
    private func displayViewBasedOnAuthStatus() {
        let accessToken = KeychainHelper.keychainHelper.read(service: "accessToken", account: "backend", type: AuthManager.self)
        
        if accessToken?.accessToken != nil {
            let defaultValue = "no token"
            print("--------------access token is------\(accessToken?.accessToken ?? defaultValue)")
            return setRootViewController(mainTabBarViewController)
        }
        return displayScreenBasedOnOnboardingStatus()
    }
    
    private func displayScreenBasedOnOnboardingStatus() {
        displayNextScreen()
    }
    
    private func displayNextScreen() {
        LocalState.hasOnboarded ? setRootViewController(loginViewController) : setRootViewController(onboardingContainerViewController)
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate {
    func setRootViewController(_ viewController: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = viewController
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = viewController
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

extension SceneDelegate: LoginViewControllerDelegate, OnboardingContainerViewControllerDelegate, ProfileSettingsViewControllerDelegate {
    
    func didLogin() {
        setRootViewController(mainTabBarViewController)
    }
    
    func didfinishOnboarding() {
        LocalState.hasOnboarded = true
        displayNextScreen()
    }
    
    func didForgetPassword() {
        setRootViewController(forgotPasswordViewController)
    }
    
    func didLogout() {
        
        setRootViewController(mainTabBarViewController)
    }
}

