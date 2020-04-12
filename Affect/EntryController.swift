//
//  EntryController.swift
//  Affect
//
//  Created by Stephanie on 4/11/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class EntryController: UIViewController {

let entryView = EntryView()
        
    override func loadView() {
        view = entryView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
        setupNavigationBarItems()
    }
    // MARK: - Selectors
    
    //Exits from view
    @objc func closeView(_ sender: UITapGestureRecognizer? = nil){
        let homeController = HomeController()
        navigationController?.pushViewControllerFromTop(controller: homeController)
    }
    
    // MARK: - Helper Functions
    
    private func setupNavigationBarItems() {
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        let closeImageView: UIButton = {
                return UIView().navigationBarItemImage(image: #imageLiteral(resourceName: "btn_close_b"))
            }()
            closeImageView.addTarget(self, action: #selector(closeView), for: .touchUpInside)

            let logoutBarButtonItem = UIBarButtonItem.init(customView: closeImageView)
            self.navigationItem.leftBarButtonItem = logoutBarButtonItem
        }
    }


