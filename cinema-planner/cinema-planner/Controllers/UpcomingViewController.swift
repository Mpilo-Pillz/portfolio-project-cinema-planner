//
//  UpcomingViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    private var isLoaded = false
    private var titles: [Title] = [Title]()
    
    private let upcomingTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        table.register(SkeletonTitleTableViewCell.self, forCellReuseIdentifier: SkeletonTitleTableViewCell.identifier)
        
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        
        fetchUpcoming()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    private func fetchUpcoming() {
        APICaller.shared.getUpcomingMovies { [weak self] result in
            switch result {
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
                self?.isLoaded = true
            case .failure(let error):
                print(error.localizedDescription)
                self?.isLoaded = true
            }
        }
    }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isLoaded {
            return titles.count
            
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoaded {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
                return UITableViewCell()
            }
            
            let title = titles[indexPath.row]
            cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Untitled Video", posterURL: title.poster_path ?? "https://picsum.photos/200/300"))
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SkeletonTitleTableViewCell.identifier, for: indexPath) as? SkeletonTitleTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let title = titles[indexPath.row]
        
        guard let titleName = title.original_title ?? title.original_name else {
            return
        }
        
        APICaller.shared.getMovie(with: titleName) { [weak self] result in
            switch result {
            case .success(let videoItem):
                guard let overViewTitle = title.overview else {
                    return
                }
                
                DispatchQueue.main.async {
                    let vc = TitlePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(title: titleName, youtubeView: videoItem, titleOverview: overViewTitle))
                    self?.navigationController?.pushViewController(vc, animated: true)
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



