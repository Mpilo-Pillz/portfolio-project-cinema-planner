//
//  HomeViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles: [String] = ["Trending Movies", "Popular", "Trending Tv", "Upcoming Movies", "Top rated"]
    var scrollIcon = "scroll.fill"
    private let homeFeedTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped) // adds the header and makes it the same as ios settings page
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavBar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    
    }
    
    private func configureNavBar() {
        var image = UIImage(named: "logoipsum")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: self.scrollIcon), style: .done, target: self, action: #selector(toggleScroll) ),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
            ]
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController {
    
    //    TODO: find a better way to handle swapping the scroll icon
    @objc func toggleScroll() {
        LocalState.hasMadeTitleBarScrollable = !LocalState.hasMadeTitleBarScrollable
        self.scrollIcon = LocalState.hasMadeTitleBarScrollable ?  "scroll" : "scroll.fill"
      
        configureNavBar()

    }
    
}


