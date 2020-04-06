//
//  FeelingsView.swift
//  Affect
//
//  Created by Stephanie on 4/2/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

// MARK: - Properties
//let feelingsTextView: UITextView = {
//    return UIView().titleTextView(placeholderText: "How do you feel?", textSize: 28)
//}()
//
//let nextBtn: UIButton = {
//    return UIView().navigationBtn(text: "Next")
//}()

// MARK: - Lifecycles
class FeelingsView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLayout()
    }

// MARK:- Setup View Layout
    fileprivate func setupLayout() {
        addSubview(feelingsTextView)
        feelingsTextView.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 120)
        feelingsTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(nextBtn)
        nextBtn.anchor(paddingBottom: 25, width: 140, height: 40)
        nextBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
