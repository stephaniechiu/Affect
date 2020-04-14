//
//  TabBarController.swift
//  Affect
//
//  Created by Stephanie on 4/13/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let homeController = HomeController()
        homeController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "home").withRenderingMode(.alwaysOriginal), tag: 0)
        
        let newEntryController = MoodController()
        newEntryController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "addEntry").withRenderingMode(.alwaysOriginal), tag: 1)

        let dataController = ActivitiesNotesController()
        dataController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "chart-1").withRenderingMode(.alwaysOriginal), tag: 2)
        
        let tabBarController = [homeController, newEntryController, dataController]
        UITabBar.appearance().barTintColor = .white
        viewControllers = tabBarController
        }
    
//    navigationController?.navigationBar.isTranslucent = false
//    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//    self.navigationController?.navigationBar.shadowImage = UIImage()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
