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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext


//    var entryInput = [EntryInput]()
    var entryInput: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
//        let newEntry = EntryInput(context: self.context)
//        newEntry.thoughts = notesInputTextView.text!
//
        self.entryInput.append("hello")
        print(entryInput)
        
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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HomeCell
        cell.entryTextLabel.text = entryInput[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
