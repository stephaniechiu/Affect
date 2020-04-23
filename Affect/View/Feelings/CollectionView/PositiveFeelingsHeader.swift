//
//  PositiveFeelingsHeader.swift
//  Affect
//
//  Created by Stephanie on 3/31/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class PositiveFeelingsHeader: UICollectionReusableView {

// MARK: - Properties
    let positiveFeelingsHeader: UITextView = {
        return UIView().titleTextView(text: "Positive", textSize: 20)
    }()

// MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .blue
        setupHeader()
    }
    
    func setupHeader() {
        addSubview(positiveFeelingsHeader)
        positiveFeelingsHeader.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        positiveFeelingsHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
