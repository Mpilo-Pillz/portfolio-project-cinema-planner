//
//  SkeletonTableViewCell.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/01/05.
//

import UIKit

class SkeletonTitleTableViewCell: UITableViewCell {
    static let identifier = "SkeletonTitleTableViewCell"
    
    let skeletonTitleLabel = makeUIView(withWidth: 170, withHeight: 20)
    let skeletonTitlePosterImage = makeUIView(withWidth: 100, withHeight: 140)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(skeletonTitleLabel)
        contentView.addSubview(skeletonTitlePosterImage)
        
        applyConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyConstraints() {
        let skeletonTitlePosterImageConstraints = [
            skeletonTitlePosterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            skeletonTitlePosterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            skeletonTitlePosterImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            skeletonTitlePosterImage.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let skeletonTitleLabelConstraints = [
            skeletonTitleLabel.leadingAnchor.constraint(equalTo: skeletonTitlePosterImage.trailingAnchor, constant: 20),
            skeletonTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            skeletonTitleLabel.widthAnchor.constraint(equalToConstant: 170),
            skeletonTitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        
        NSLayoutConstraint.activate(skeletonTitlePosterImageConstraints)
        NSLayoutConstraint.activate(skeletonTitleLabelConstraints)
    }
}
