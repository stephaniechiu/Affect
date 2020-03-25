//
//  ViewController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var moodView: MoodView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func setupView() {
        let moodFirstView = MoodView(frame: self.view.frame)
        self.moodView = moodFirstView
        self.view.addSubview(moodView)
        moodView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        moodView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        moodView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        moodView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        moodView.translatesAutoresizingMaskIntoConstraints = false
    }
}
