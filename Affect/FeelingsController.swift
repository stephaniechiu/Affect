//
//  DescribeFeelingsController.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

private let headerIdentifier = "Header"
private let cellIdentifier = "FeelingsCell"

class FeelingsController: UICollectionViewController {

// MARK:- Properties

    var positiveFeelingsLabel: [String] = ["understanding", "confident", "sympathetic", "satisfied", "kind", "great", "lucky", "fortunate", "important", "elated", "playful", "energetic", "optimistic", "free", "wonderful", "pleased", "comfortable", "calm", "relaxed", "blessed"]
    var negativeFeelingsLabel: [String] = []
    
    let columnLayout = ColumnFlowLayout(
           cellsPerRow: 5,
           minimumInteritemSpacing: 2,
           minimumLineSpacing: 2,
           sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       )
    
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let height = UIScreen.main.bounds.size.height
        layout.estimatedItemSize = CGSize(width: 20, height: height)
        return layout
    }()

// MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white

        //Register Header
        collectionView!.register(FeelingsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView?.collectionViewLayout = layout

        collectionView.contentInsetAdjustmentBehavior = .never //for iPhone 11 models and up
        
        //Register Cell
        collectionView.register(FeelingsCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

// MARK:- UICollectionViewDelegate/Datasource
extension FeelingsController {
    
    //for header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! FeelingsHeader
        return header
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return positiveFeelingsLabel.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FeelingsCell
        positiveFeelingsLabel.sort()
        cell.cellLabel.text = positiveFeelingsLabel[indexPath.row]
        return cell
    }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension FeelingsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}
