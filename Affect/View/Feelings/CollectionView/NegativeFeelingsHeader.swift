//
//  NegativeFeelingsHeader.swift
//  Affect
//
//  Created by Stephanie on 4/10/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class NegativeFeelingsHeader: UICollectionReusableView {

// MARK: - Properties
    let negativeFeelingsHeader: UITextView = {
        return UIView().titleTextView(placeholderText: "Negative", textSize: 20)
    }()

// MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .red
        setupHeaderPositive()
    }
    
    func setupHeaderPositive() {
        addSubview(negativeFeelingsHeader)
        negativeFeelingsHeader.anchor(top: topAnchor, paddingTop: 10)
        negativeFeelingsHeader.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
