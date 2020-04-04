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
        cellLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
