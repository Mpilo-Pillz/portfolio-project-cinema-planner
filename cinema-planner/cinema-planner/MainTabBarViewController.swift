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
        view.backgroundColor = .blue
        
        let vcHome = UINavigationController(rootViewController: HomeViewController())
        let vcUpcoming = UINavigationController(rootViewController: UpcomingViewController())
        let vcSearch = UINavigationController(rootViewController: SearchViewController())
        let vcDownloads = UINavigationController(rootViewController: DownloadsViewController())
        
        
        
        setViewControllers([vcHome, vcUpcoming, vcSearch, vcDownloads], animated: true)
    }


}

