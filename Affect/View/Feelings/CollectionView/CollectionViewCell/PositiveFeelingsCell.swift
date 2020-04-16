//
//  PositiveFeelingsCell.swift
//  Affect
//
//  Created by Stephanie on 4/9/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class PositiveFeelingsCell: UICollectionViewCell {
    let cellLabel: UILabel! = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Gill Sans", size: 12)
        
        return label
    }()
    
    // MARK:- Lifecycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 13
        
        addSubview(cellLabel)
        cellLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, height: 25)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
