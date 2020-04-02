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
        label.font = UIFont(name: "American Typewriter", size: 16)
        return label
    }()
    
//    var image: UIImage? {
//        didSet {
//            guard let image = image else { return }
//            imageTest.image = image
//        }
//    }
//    let imageTest: UIImageView = {
//        let iv = UIImageView()
//        iv.image = #imageLiteral(resourceName: "HealthyEating_w")
//        iv.contentMode = .scaleAspectFill
//        return iv
//    }()
    
    // MARK:- Lifecycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellLabel)
        cellLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
