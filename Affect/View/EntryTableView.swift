//
//  MainController.swift
//  Affect
//
//  Created by Stephanie on 3/28/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit


private var dateLabel: UILabel = {
    var date = UILabel()
    date.text = "MMM DD"
    date.font = UIFont(name: "American Typewriter", size: 16)
    date.textColor = .black
    
    return date
}()

private var timeLabel: UILabel = {
    var time = UILabel()
    time.text = "hh:mm"
    time.font = UIFont(name: "American Typewriter", size: 10)
    time.textColor = .lightGray
    return time
}()

private let moodEntryContainerView: UIView = {
    let view = UIView()
    //view.backgroundColor = .lightGray
    
    view.addSubview(dateLabel)
    dateLabel.centerY(inView: view)
    dateLabel.anchor(left: view.leftAnchor, paddingLeft: 8)
    
    let moodIconView = UIImageView()
    moodIconView.image = #imageLiteral(resourceName: "Awesome")
    view.addSubview(moodIconView)
    moodIconView.centerY(inView: view)
    moodIconView.anchor(left: dateLabel.rightAnchor, paddingLeft: 8, width: 30, height: 30)
    
    return view
}()

class EntryTableView: UIViewController {
    
    let moodEntryTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        view.backgroundColor = .white
        
        view.addSubview(moodEntryContainerView)
        moodEntryContainerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 80, paddingLeft: 16, paddingRight: 16, height: 50)
    }
    
    func setupTableView() {
        moodEntryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(moodEntryTableView)
        
        NSLayoutConstraint.activate([
            moodEntryTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            moodEntryTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            moodEntryTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            moodEntryTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        moodEntryTableView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }
    
}
