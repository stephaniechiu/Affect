//
//  CustomNavigationController.swift
//  Affect
//
//  Created by Stephanie on 4/21/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            setupNavigationBar()
        }
    
    func setupNavigationBar() {
        setNavigationBarHidden(true, animated: false)
        navigationBar.isTranslucent = true
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
}
