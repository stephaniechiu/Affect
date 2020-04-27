//
//  HomeController.swift
//  Affect
//
//  Created by Stephanie on 3/28/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "HomeCell"

class HomeController: UIViewController {

    let tableView = UITableView()
    let moodController = MoodController()
    
    var entryInput: [String] = []
//    var entryInputList: [NSManagedObject] = []
//    let entryInput = [
//        UserEntryInput(thoughts: "abc", gratitude: "def"),
//        UserEntryInput(thoughts: "123", gratitude: "432"),
//        UserEntryInput(thoughts: "abc", gratitude: "def"),
//        UserEntryInput(thoughts: "123", gratitude: "432"),
//        UserEntryInput(thoughts: "abc", gratitude: "def")
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {

        tableView.reloadData()
    }
    
    func setupLayout() {
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
    //Register tableView
        tableView.register(HomeCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 80
        
    //Removes separator lines
        tableView.tableFooterView = UIView()
        
        let height = view.frame.height
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDelegate/DataSource
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let monthSectionHeader = UIView().titleTextView(text: "January", textSize: 20)
        return monthSectionHeader
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entryInput.count
//        return section == 0 ? entryInput.count : 1
//        if section == 0 {
//            return 2
//        }
//        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HomeCell
        
        let inputEntry = entryInput[indexPath.row]
        cell.entryTextView.text = inputEntry
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(entryInput[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // MARK: - Selectors
    
    // MARK: - Helper Functions
}
