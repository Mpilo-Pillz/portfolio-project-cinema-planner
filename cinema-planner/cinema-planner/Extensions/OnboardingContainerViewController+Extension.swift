//
//  OnboardingContainerViewController+Extension.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/25.
//

import UIKit

// MARK: - UIPageViewControllerDataSource
extension
OnboardingContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }
    
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = onboardingPages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentOnboardingViewController = onboardingPages[index - 1]
        return onboardingPages[index - 1]
    }
    
    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = onboardingPages.firstIndex(of: viewController), index + 1 < onboardingPages.count else { return nil }
        currentOnboardingViewController = onboardingPages[index + 1]
        return onboardingPages[index + 1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return onboardingPages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return onboardingPages.firstIndex(of: self.currentOnboardingViewController) ?? 0
    }
}

// MARK: - Onboarding Actions Tapped
extension OnboardingContainerViewController {
    @objc func nextTapped(_ sender: UIButton) {
        guard let nextViewController = getNextViewController(from: currentOnboardingViewController) else { return }
        pageViewController.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
    
    @objc func backTapped(_ sender: UIButton) {
        guard let previousViewController = getPreviousViewController(from: currentOnboardingViewController) else { return }
        pageViewController.setViewControllers([previousViewController], direction: .reverse, animated: true, completion: nil)
    }
    
    @objc func closeTapped(_ sender: UIButton) {
        delegate?.didfinishOnboarding()
    }
    
    @objc func doneTapped(_ sender: UIButton) {
        delegate?.didfinishOnboarding()
    }
}
