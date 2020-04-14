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

        let settingsController = HomeController()
        settingsController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0 )
        
        let newEntryController = MoodController()
        newEntryController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let dataController = ActivitiesNotesController()
        dataController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        let tabBarController = [settingsController, newEntryController, dataController]
        viewControllers = tabBarController
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
