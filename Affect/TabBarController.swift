//
//  TabBarController.swift
//  Affect
//
//  Created by Stephanie on 4/13/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    let homeController = HomeController()
    let newEntryController = EntryController()
    let dataController = StatisticsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.delegate = self
        
        setupTabBarItems()
    }
    
    fileprivate func setupTabBarItems() {

        homeController.tabBarItem.image = #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal)
        newEntryController.tabBarItem.image = #imageLiteral(resourceName: "addEntry").withRenderingMode(.alwaysOriginal)
        dataController.tabBarItem.image = #imageLiteral(resourceName: "chart-1").withRenderingMode(.alwaysOriginal)
        
        for tabBarItem in tabBar.items! {
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        let tabBarController = [homeController, newEntryController, dataController]
        UITabBar.appearance().barTintColor = .white
        viewControllers = tabBarController
    }
    
// MARK: - UITabBarDelegate
    //When the 2nd tabBarItem is selected, MoodController is presented modally over the current view, allowing user to record an entry
    
    internal func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: EntryController.self) {
           let vc =  MoodController()
           vc.modalPresentationStyle = .overFullScreen
           self.present(vc, animated: true, completion: nil)
           return false
        }
        return true
    }
}
