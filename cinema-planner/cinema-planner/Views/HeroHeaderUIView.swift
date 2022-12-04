//
//  HeroHeaderUIView.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2022/11/20.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let addToWatchListButton: UIButton = makeSecondaryButton(withText: "WatchList", withButtonType: .normal)
    
    private let playButton: UIButton = makeSecondaryButton(withText: "Play", withButtonType: .normal)
    
    private let heroImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds =  true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(addToWatchListButton)
        applyConstraints()
    }
    
    private func applyConstraints() {
        let playButtonConstraints = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let addToWatchListButtonConstraionts = [
            addToWatchListButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            addToWatchListButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            
            addToWatchListButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(playButtonConstraints)
        NSLayoutConstraint.activate(addToWatchListButtonConstraionts)
    }
    
    public func configure(with model: TitleViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        heroImageView.sd_setImage(with: url, completed: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("Something went wrong in HeroHeaderUIView")
    }
}
