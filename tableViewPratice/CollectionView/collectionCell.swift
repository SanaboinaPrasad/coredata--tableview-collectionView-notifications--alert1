//
//  collectionCell.swift
//  tableViewPratice
//
//  Created by Sriram Prasad on 13/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
class CollectionCell: UICollectionViewCell {
    
    let profileImage : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "1.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        setupConstraints()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupConstraints(){
        let constraints =
            [
        profileImage.topAnchor.constraint(equalTo: topAnchor),
        profileImage.trailingAnchor.constraint(equalTo: trailingAnchor),
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor),
        profileImage.bottomAnchor.constraint(equalTo: bottomAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
}
