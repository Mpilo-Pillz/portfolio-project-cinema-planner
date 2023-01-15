//
//  SkeletonTableViewCell.swift
//  cinema-planner
//
//  Created by Mpilo Pillz on 2023/01/05.
//

import UIKit

class SkeletonTitleTableViewCell: UITableViewCell {
    static let identifier = "SkeletonTitleTableViewCell"
    
    let skeletonTitleLabel = makeLabel(withText: "         ", alignment: .center, forTextStyle: .body)
    let skeletonTitlePosterImage = makeUIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(skeletonTitleLabel)
        contentView.addSubview(skeletonTitlePosterImage)
        contentView.backgroundColor = .orange
        
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
        
        NSLayoutConstraint.activate(skeletonTitlePosterImageConstraints)
    }
    
}
