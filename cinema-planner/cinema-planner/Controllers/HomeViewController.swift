//
//  HomeViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import UIKit

//protocol HomeViewControllerDelegate: AnyObject {
//    func didLogout()
//}

class HomeViewController: UIViewController {
    
    private var randomTrendingMovie: Title?
    private var headerView: HeroHeaderUIView?
    
    let sectionTitles: [String] = ["Trending Movies", "Trending Tv", "Popular",  "Upcoming Movies", "Top rated"]
    var scrollIcon = "scroll.fill"
    
//    weak var delegate: HomeViewControllerDelegate?
    
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
        
        headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
        configureHeroHeaderView()
    }
    
    private func configureHeroHeaderView() {
        
        APICaller.shared.getTrendingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                let selectedTitle = titles.randomElement()
                
                self?.randomTrendingMovie = selectedTitle
                self?.headerView?.configure(with: TitleViewModel(titleName: selectedTitle?.original_title ?? selectedTitle?.original_name ?? "", posterURL: selectedTitle?.poster_path ?? ""))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureNavBar() {
        var image = UIImage(named: "logoipsum")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person")?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(logout)),
            UIBarButtonItem(image: UIImage(systemName: self.scrollIcon)?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(toggleScroll) ),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle")?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .done, target: self, action: nil)
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
    
    @objc func logout() {
        KeychainHelper.keychainHelper.delete(service: "accessToken", account: "backend")

    }
}
