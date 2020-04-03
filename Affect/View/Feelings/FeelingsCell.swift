//
//  Feelings Cell.swift
//  Affect
//
//  Created by Stephanie on 4/1/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class FeelingsCell: UICollectionViewCell {
    // MARK:- Properties
    
    let cellLabel: UILabel! = {
        let label = UILabel()
        //label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 12)
        
        return label
    }()
    
    // MARK:- Lifecycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellLabel)
        cellLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 40)
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        setNeedsLayout()
//        layoutIfNeeded()
//        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
//        var frame = layoutAttributes.frame
//        frame.size.width = ceil(size.width)
//        layoutAttributes.frame = frame
//        return layoutAttributes
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
