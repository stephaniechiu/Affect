//
//  EntryView.swift
//  Affect
//
//  Created by Stephanie on 4/11/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

// MARK: - Properties
let entryDateTimeLabel: UILabel = {
    let now = Date()
    let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.setLocalizedDateFormatFromTemplate("h:mm")
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = "Jan 01"
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 35)
        label.isUserInteractionEnabled = true
    return label
}()

class EntryView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        addSubview(entryDateTimeLabel)
        entryDateTimeLabel.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 50)
        entryDateTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
