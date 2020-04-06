////
////  DescribeFeelingsController.swift
////  Affect
////
////  Created by Stephanie on 3/30/20.
////  Copyright © 2020 Stephanie Chiu. All rights reserved.
////
//
//import UIKit
//
//private let headerIdentifier = "Header"
//private let cellIdentifier = "Cell"
////private let negativeCellIdentifier = "NegativeCell"
//
//let positiveCollectionView = collectionViews.positiveCollectionView()
//let negativeCollectionView = collectionViews.negativeCollectionView()
//
//class FeelingsController: UICollectionViewController {
//
//// MARK:- Properties
//
//    var positiveFeelingsLabel: [String] = ["understanding", "confident", "sympathetic", "satisfied", "kind", "great", "lucky", "fortunate", "important", "bold", "playful", "energetic", "optimistic", "free", "wonderful", "pleased", "comfortable", "calm", "relaxed", "blessed", "loving", "eager"]
//    var negativeFeelingsLabel: [String] = ["irritated", "disappointed", "ashamed", "miserable", "upset", "indecisive", "embarrassed", "shy", "alone", "fatigued", "stressed", "tense", "resentful", "nervous", "suspicious", "offended", "nonchalant", "bored", "wronged", "dismayed", "threatened", "terrified"]
//
//    var layout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        let height = UIScreen.main.bounds.size.height
//        layout.estimatedItemSize = CGSize(width: 20, height: height)
//        return layout
//    }()
//
//// MARK:- Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.backgroundColor = .white
//
//        positiveCollectionView.delegate = self
//        positiveCollectionView.dataSource = self
//
//        var nib = UINib(nibName: "UICollectionElementKindCell", bundle:nil)
//        self.collectionView.register(nib, forSupplementaryViewOfKind: <#T##String#>, withReuseIdentifier: <#T##String#>)
//
//        //Register Header
////        positiveCollectionView.register(FeelingsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
//        collectionView?.collectionViewLayout = layout
//        collectionView.contentInsetAdjustmentBehavior = .never //for iPhone 11 models and up
//
//        //Register Cell
//        positiveCollectionView.register(FeelingsCell.self, forCellWithReuseIdentifier: cellIdentifier)
////        negativeCollectionView.register(FeelingsCell.self, forCellWithReuseIdentifier: negativeCellIdentifier)
//    }
//}
//
//// MARK:- UICollectionViewDelegate/Datasource
//extension FeelingsController {
//
////    for header
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if collectionView == positiveCollectionView {
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! FeelingsHeader
//            return header
//        }
//
//    }
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == positiveCollectionView {
//            return positiveFeelingsLabel.count
//        } else {
//            return negativeFeelingsLabel.count
//        }
//    }
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FeelingsCell
//        if collectionView == positiveCollectionView {
//            positiveFeelingsLabel.sort()
//            cell.backgroundColor = .orange
//            cell.cellLabel.text = positiveFeelingsLabel[indexPath.row]
//        } else {
//            negativeFeelingsLabel.sort()
//            cell.backgroundColor = .orange
//            cell.cellLabel.text = negativeFeelingsLabel[indexPath.row]
//        }
//        return cell
//    }
//}
//
//// MARK:- UICollectionViewDelegateFlowLayout
//extension FeelingsController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.width, height: 150)
//    }
//
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout
//        collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20.0
//    }
//}
