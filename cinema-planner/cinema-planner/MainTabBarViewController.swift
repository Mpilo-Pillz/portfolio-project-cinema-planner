//
//  ViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.


import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcHome = UINavigationController(rootViewController: HomeViewController())
        let vcUpcoming = UINavigationController(rootViewController: UpcomingViewController())
        let vcSearch = UINavigationController(rootViewController: SearchViewController())
        let vcToWatchList = UINavigationController(rootViewController: ToWatchListViewController())
        let vcProfileSettings = UINavigationController(rootViewController: ProfileSettingsViewController())
        
        vcHome.tabBarItem.image = UIImage(systemName: "house")
        vcUpcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        vcSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vcToWatchList.tabBarItem.image = UIImage(systemName: "star")
        vcProfileSettings.tabBarItem.image = UIImage(systemName: "gearshape")
        
        vcHome.title = "Home"
        vcUpcoming.title = "Coming Soon"
        vcSearch.title = "Top Search"
        vcToWatchList.title = "Watchlist"
        vcProfileSettings.title = "Settings"
        
        tabBar.tintColor = .label
        
        setViewControllers([vcHome, vcUpcoming, vcSearch, vcToWatchList, vcProfileSettings], animated: true)
    }
}

