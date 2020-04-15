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

        homeController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal), tag: 0)
        homeController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        newEntryController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "addEntry").withRenderingMode(.alwaysOriginal), tag: 1)
        newEntryController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        dataController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "chart-1").withRenderingMode(.alwaysOriginal), tag: 2)
        dataController.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        
        let tabBarController = [homeController, newEntryController, dataController]
        UITabBar.appearance().barTintColor = .white
        viewControllers = tabBarController
    }
    
    //When the 2nd tabBarItem is selected, MoodController is presented modally over the current view, allowing user to record an entry
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 1 {
            tabBarController.present(MoodController(), animated: true, completion: nil)
        }
    }
}
