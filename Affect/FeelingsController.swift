//
//  DescribeFeelingsController.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

private let headerIdentifier = "Header"
private let cellIdentifier = "Feelings Cell"

class FeelingsController: UICollectionViewController {

// MARK:- Properties

    let images: [UIImage] = [#imageLiteral(resourceName: "Gardening_w"), #imageLiteral(resourceName: "Shopping_w"), #imageLiteral(resourceName: "Friends_w"), #imageLiteral(resourceName: "GoodMeal_w")]
    var feelingsLabel: [String] = ["Excited", "Thankful", "Hopeful"]
    
    let positiveFeelingsTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "Positive", textSize: 20)
    }()
    let negativeFeelingsTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "Negative", textSize: 20)
    }()

//    let feelingsCollectionViewLayout: UICollectionViewFlowLayout = {
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
//        layout.itemSize = CGSize(width: 250, height: 150)
//
//        return layout
//    }()

// MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white

        //Register Header
        collectionView!.register(FeelingsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.contentInsetAdjustmentBehavior = .never //for iPhone 11 models and up
        
        //Register Cell
        collectionView.register(FeelingsCell.self, forCellWithReuseIdentifier: cellIdentifier)
//        loadSubview()
    }
    
//        fileprivate func loadSubview() {
//
//
//            view.addSubview(positiveFeelingsTextView)
//            positiveFeelingsTextView.anchor(top: describeFeelingsTextView.bottomAnchor, paddingTop: 20)
//            describeFeelingsTextView.centerX(inView: view)
//
//            view.addSubview(negativeFeelingsTextView)
//            negativeFeelingsTextView.anchor(top: positiveFeelingsTextView.bottomAnchor, paddingTop: 20)
//            describeFeelingsTextView.centerX(inView: view)
//        }
    }

// MARK:- UICollectionViewDelegate/Datasource
extension FeelingsController {
    
    //for header
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! FeelingsCollectionReusableView
        return header
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feelingsLabel.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FeelingsCell
        cell.backgroundColor = .orange
        cell.cellLabel.text = feelingsLabel[indexPath.row]
        //cell.image = images[indexPath.row]
        return cell
    }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension FeelingsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    //pixel spacing between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //pixel spacing between rows
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
}
