//
//  OnboardingContainerViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/25.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didfinishOnboarding()
}
class OnboardingContainerViewController: UIViewController {
    
    let pageViewController: UIPageViewController
    var onboardingPages = [UIViewController]()
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    var currentOnboardingViewController: UIViewController {
        didSet {
            guard let index = onboardingPages.firstIndex(of: currentOnboardingViewController) else { return }
            nextButton.isHidden = index == onboardingPages.count - 1
            backButton.isHidden = index == 0
            doneButton.isHidden = !(index == onboardingPages.count - 1)
        }
    }
    
    let nextButton = UIButton(type: .system)
    let backButton = UIButton(type: .system)
    let closeButton = UIButton(type: .system)
    let doneButton = UIButton(type: .system)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        let page1 = OnboardingViewController(heroImageName: "rectangle.fill.on.rectangle.fill", titleText: "Like going to the Cinema? Did you see the list of movies planned for this year?")
        let page2 = OnboardingViewController(heroImageName: "rectangle.on.rectangle", titleText: "Now you can keep track of movies that you plan to watch and set reminders as the release date draws near, set if you are looking forward to watching the movie")
        let page3 = OnboardingViewController(heroImageName: "video.fill.badge.plus", titleText: "Mark the moview you plan to watch and the movies you have already watched, and rate them.")
        
        onboardingPages.append(page1)
        onboardingPages.append(page2)
        onboardingPages.append(page3)
        
        currentOnboardingViewController = onboardingPages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
    }
    
    private func setup() {
        view .backgroundColor = .systemRed
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        pageViewController.dataSource = self
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor)
        ])
        
        pageViewController.setViewControllers([onboardingPages.first!], direction: .forward, animated: false, completion: nil)
        currentOnboardingViewController = onboardingPages.first!
    }
    
    private func style() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: [])
        nextButton.setTitleColor(.white, for: [])
        nextButton.addTarget(self, action: #selector(nextTapped), for: .primaryActionTriggered)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Back", for: [])
        backButton.setTitleColor(.white, for: [])
        backButton.addTarget(self, action: #selector(backTapped), for: .primaryActionTriggered)
            
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: [])
        doneButton.setTitleColor(.white, for: [])
        doneButton.addTarget(self, action: #selector(doneTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.addSubview(nextButton)
        view.addSubview(backButton)
        view.addSubview(closeButton)
        view.addSubview(doneButton)
        
        activateContraints()
    }
    
    private func activateContraints() {
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 4)
        ])
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 4)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        ])
        
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: doneButton.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: doneButton.bottomAnchor, multiplier: 4)
        ])
    }
}




