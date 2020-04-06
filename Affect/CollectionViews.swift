//
//  CollectionViews.swift
//  Affect
//
//  Created by Stephanie on 4/4/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

var samplelayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    let height = UIScreen.main.bounds.size.height
    layout.estimatedItemSize = CGSize(width: 20, height: height)
    return layout
}()

class collectionViews {
    static func positiveCollectionView() -> UICollectionView {
        let positiveCollectionView = UICollectionView(frame: CGRect(x: 0, y: 40, width: 200, height: 200), collectionViewLayout: samplelayout)
        return positiveCollectionView
    }
    
    static func negativeCollectionView() -> UICollectionView {
        let negativeCollectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: 200, height: 200), collectionViewLayout: samplelayout)
        return negativeCollectionView
    }
}
