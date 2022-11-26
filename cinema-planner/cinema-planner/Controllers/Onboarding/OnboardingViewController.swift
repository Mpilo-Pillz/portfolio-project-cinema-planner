//
//  OnboardingViewController.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/25.
//

import UIKit

class OnboardingViewController: UIViewController {
    let stackView = makeStackView(withSpacing: 20, withAxis: .vertical)
    let imageView = UIImageView()
    let label = UILabel()
    
    let heroImageName: String
    let titleText: String

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
}
