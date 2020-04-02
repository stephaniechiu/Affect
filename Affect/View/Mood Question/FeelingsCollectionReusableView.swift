//
//  FeelingsCollectionViewCell.swift
//  Affect
//
//  Created by Stephanie on 3/31/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class FeelingsCollectionReusableView: UICollectionReusableView {

    let describeFeelingsTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "What describes your feelings?", textSize: 30)
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .blue
        addSubview(describeFeelingsTextView)
        describeFeelingsTextView.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, paddingTop: 100, paddingLeft: 25, paddingRight: 25)
        describeFeelingsTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}