//
//  ActivitiesNotesController.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

// MARK: - Properties
let activitiesCellIdentifier = "AnotherCell"

let activitiesTextView: UITextView = {
    return UIView().titleTextView(placeholderText: "What have you been up to?", textSize: 35)
}()

let activitiesStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: setNavButtons())
    stackView.spacing = 180
    stackView.distribution = .fillEqually
    return stackView
}()

func setNavButtons() -> [UIButton]{
    let nextBtn = UIView().navigationBtn(text: "Next")
    let saveBtn = UIView().navigationBtn(text: "Save & Go")
    return [nextBtn, saveBtn]
}

let notesThoughtsTextView: UITextView = {
    return UIView().titleTextView(placeholderText: "notes & thoughts", textSize: 28)
}()

class ActivitiesNotesController: UIViewController {
    weak var activitiesCollectionView: UICollectionView!
    
    var columnLayout = ColumnFlowLayout(cellsPerRow: 5, minimumInteritemSpacing: 2, minimumLineSpacing: 2, sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    
    let activitiesImage: [UIImage] = [#imageLiteral(resourceName: "Family_b"), #imageLiteral(resourceName: "GoodMeal_b"), #imageLiteral(resourceName: "HealthyEating_b"), #imageLiteral(resourceName: "Sports_b"), #imageLiteral(resourceName: "Games_b"), #imageLiteral(resourceName: "Movies_b"), #imageLiteral(resourceName: "Travel_b"), #imageLiteral(resourceName: "Shopping_b"), #imageLiteral(resourceName: "Friends_b"), #imageLiteral(resourceName: "Gardening_b"), #imageLiteral(resourceName: "Hobby_b"), #imageLiteral(resourceName: "Exercise_b"), #imageLiteral(resourceName: "SocialMedia_b"), #imageLiteral(resourceName: "Reading_b"), #imageLiteral(resourceName: "Work_b"), #imageLiteral(resourceName: "GoodSleep_b"), #imageLiteral(resourceName: "Date_b")]

// MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        
        setupActivitiesLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.activitiesCollectionView.dataSource = self
        self.activitiesCollectionView.delegate = self
        self.activitiesCollectionView.register(ActivitiesCell.self, forCellWithReuseIdentifier: activitiesCellIdentifier)
        self.activitiesCollectionView.backgroundColor = .white
    }
    
    fileprivate func setupActivitiesLayout() {
        self.view.addSubview(activitiesTextView)
        activitiesTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 130, paddingLeft: 20, paddingRight: 20, width: view.frame.width)
        activitiesTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let activitiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        activitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activitiesCollectionView)
        activitiesCollectionView.anchor(top: activitiesTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20, height: 200)
        
        self.activitiesCollectionView = activitiesCollectionView
        
        self.view.addSubview(activitiesStackView)
        activitiesStackView.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 10, height: 40)
        activitiesStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

// MARK: - UICollectionView DataSource and Delegate
extension ActivitiesNotesController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activitiesImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = activitiesCollectionView.dequeueReusableCell(withReuseIdentifier: activitiesCellIdentifier, for: indexPath) as! ActivitiesCell
        cell.image = activitiesImage[indexPath.row]
        return cell
    }
}

// MARK: - UICollectionView FlowLayout
extension ActivitiesNotesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 30.0, height: 30.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}
