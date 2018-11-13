//
//  CollectionView.swift
//  tableViewPratice
//
//  Created by Sriram Prasad on 13/11/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit
class CollectionVC: UICollectionViewController ,UICollectionViewDelegateFlowLayout{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "cell")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
//        cell.profileImage.image = UIImage(named: "1.jpg")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}

