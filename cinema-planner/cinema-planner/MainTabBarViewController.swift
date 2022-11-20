//
//  ViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
///Users/mpilopillz/Development/Mobile/XCodeProjects/Projects/portfolio-project-cinema-planner/cinema-planner/cinema-planner/ViewController.swift

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let vcHome = UINavigationController(rootViewController: HomeViewController())
        let vcUpcoming = UINavigationController(rootViewController: UpcomingViewController())
        let vcSearch = UINavigationController(rootViewController: SearchViewController())
        let vcDownloads = UINavigationController(rootViewController: DownloadsViewController())
        
        vcHome.tabBarItem.image = UIImage(systemName: "house")
        vcUpcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        vcSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        vcDownloads.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        vcHome.title = "Home"
        vcUpcoming.title = "Coming Soon"
        vcSearch.title = "Top Search"
        vcDownloads.title = "Download"
        
        tabBar.tintColor = .label
        
        setViewControllers([vcHome, vcUpcoming, vcSearch, vcDownloads], animated: true)
    }


}

