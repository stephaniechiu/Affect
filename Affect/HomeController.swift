//
//  MainController.swift
//  Affect
//
//  Created by Stephanie on 3/28/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "HomeCell"

class HomeController: UIViewController {
    private let tableView = UITableView()
    //private final let titleHeaderHeight: CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        setupLayout()
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
        let monthSectionHeader = UIView().titleTextView(placeholderText: "January", textSize: 20)
        return monthSectionHeader
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : 5
//        if section == 0 {
//            return 2
//        }
//        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! HomeCell
        return cell
    }
    // MARK: - Selectors
    
    // MARK: - Helper Functions
    private func setupNavigationBarItems() {
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.title = "Affect"
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}
