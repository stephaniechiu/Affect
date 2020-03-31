//
//  MoodEntryCell.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class MoodEntryCell: UITableViewCell {
    
    var moodIconImageView = UIImageView()
    var dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(moodIconImageView)
        addSubview(dateLabel)
        
        set()
        configureImageView()
        configureDateLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set() {
        moodIconImageView.image = #imageLiteral(resourceName: "GoodSleep_b")
        dateLabel.text = "MMDD"
    }
    
    func configureImageView() {
        moodIconImageView.anchor(left: dateLabel.rightAnchor, paddingLeft: 8, width: 70, height: 70)
        moodIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func configureDateLabel() {
        dateLabel.numberOfLines = 2
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.anchor(left: leftAnchor, paddingLeft: 12)
    }
}
