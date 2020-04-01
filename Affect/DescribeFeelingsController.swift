//
//  DescribeFeelingsController.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class DescribeFeelingsController: UIViewController {
    
    let describeFeelingsTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "What describes your feelings?", textSize: 30)
    }()
    
    let positiveFeelingsTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "Positive", textSize: 20)
    }()
    
    let negativeFeelingsTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "Negative", textSize: 20)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addSubview()
    }
    
    fileprivate func addSubview() {
        view.addSubview(describeFeelingsTextView)
        describeFeelingsTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, paddingTop: 100, paddingLeft: 25, paddingRight: 25)
        describeFeelingsTextView.centerX(inView: view)
        
        view.addSubview(positiveFeelingsTextView)
        positiveFeelingsTextView.anchor(top: describeFeelingsTextView.bottomAnchor, paddingTop: 20)
        describeFeelingsTextView.centerX(inView: view)

        view.addSubview(negativeFeelingsTextView)
        negativeFeelingsTextView.anchor(top: positiveFeelingsTextView.bottomAnchor, paddingTop: 20)
        describeFeelingsTextView.centerX(inView: view)
    }

}
