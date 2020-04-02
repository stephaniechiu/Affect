//
//  DescribeFeelingsController.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

private let headerIdentifier = "Header"

class FeelingsController: UICollectionViewController {

// MARK:- Properties

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

        collectionView!.register(FeelingsCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.contentInsetAdjustmentBehavior = .never //for iPhone 11 models and up
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
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath)
        return header
    }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension FeelingsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
