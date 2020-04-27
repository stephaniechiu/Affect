//
//  HomeCell.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
// MARK: - Properties
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "American Typewriter", size: 14)
        label.text = "Jan 07"
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .lightGray
        label.text = "11:23 PM"
        return label
    }()
    
    let moodIcon: UIButton = {
        let icon: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Great"))
        return icon
    }()
    
    let entryTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ac erat lobortis, sagittis dui et, pretium quam. Curabitur vitae libero mauris."
        textView.font = UIFont(name: "Gill Sans", size: 14)
        textView.backgroundColor = .clear
        textView.textAlignment = .left
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.textContainer.maximumNumberOfLines = 2
        return textView
    }()
    
    let activitiesImage: [UIImage?] = [#imageLiteral(resourceName: "Family_b"), #imageLiteral(resourceName: "HealthyEating_b"), #imageLiteral(resourceName: "Sports_b")]
    
// MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

//        selectionStyle = .none
        
        setupCellLayout()
    }
    
    fileprivate func setupCellLayout() {
        let dateTimeStack = UIStackView(arrangedSubviews: [dateLabel, timeLabel])
        dateTimeStack.axis = .vertical
        dateTimeStack.distribution = .fillEqually
        dateTimeStack.spacing = 2
        
        let entryStack = UIStackView(arrangedSubviews: [entryTextView])
        entryStack.axis = .vertical
        entryStack.distribution = .fillEqually
        entryStack.spacing = 2
        
        addSubview(dateTimeStack)
        dateTimeStack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 20)
        
        addSubview(moodIcon)
        moodIcon.anchor(left: dateTimeStack.rightAnchor, paddingLeft: 10, width: 35, height: 35)
        moodIcon.centerY(inView: self)
        
        addSubview(entryStack)
        entryStack.anchor(left: moodIcon.rightAnchor, right: rightAnchor, paddingLeft: 10, paddingRight: 20)
        entryStack.centerY(inView: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
