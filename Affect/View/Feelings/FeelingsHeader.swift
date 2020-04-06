//
//  FeelingsCollectionViewCell.swift
//  Affect
//
//  Created by Stephanie on 3/31/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class FeelingsHeader: UICollectionReusableView {

// MARK: - Properties
    let positiveFeelingsHeader: UITextView = {
        return UIView().titleTextView(placeholderText: "Positive", textSize: 30)
    }()
    
    let negativeFeelingsHeader: UITextView = {
        return UIView().titleTextView(placeholderText: "Negative", textSize: 30)
    }()

// MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .blue
        setupHeaderPositive()
    }
    
    func setupHeaderPositive() {
        addSubview(positiveFeelingsHeader)
        positiveFeelingsHeader.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, paddingTop: 10, paddingLeft: 25, paddingRight: 25)
        positiveFeelingsHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
//        addSubview(negativeFeelingsHeader)
//        negativeFeelingsHeader.anchor(top: topAnchor, left: safeAreaLayoutGuide.leftAnchor, paddingTop: 10, paddingLeft: 25, paddingRight: 25)
//        negativeFeelingsHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
