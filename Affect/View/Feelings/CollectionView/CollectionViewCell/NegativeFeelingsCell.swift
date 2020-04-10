//
//  NegativeFeelingsCell.swift
//  Affect
//
//  Created by Stephanie on 4/9/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class NegativeFeelingsCell: UICollectionViewCell {
    let cellLabel: UILabel! = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 12)
        
        return label
    }()
    
    // MARK:- Lifecycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellLabel)
        //cellLabel.backgroundColor = .yellow
        cellLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 25)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
