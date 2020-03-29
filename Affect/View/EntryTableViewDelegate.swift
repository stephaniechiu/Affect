//
//  EntryTableViewDelegate.swift
//  Affect
//
//  Created by Stephanie on 3/28/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    func setupTableView() {
        moodEntryTableView.delegate = self
        moodEntryTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
}
