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

var notesContainerView: UIView = {
    let view = UIView()
    //view.layer.cornerRadius = 12
    view.backgroundColor = UIColor(red: 216/256, green: 216/256, blue: 216/256, alpha: 0.3)
    
    let notesThoughtsTextView: UITextView = UIView().titleTextView(placeholderText: "notes & thoughts", textSize: 20)
    //notesThoughtsTextView.backgroundColor = .red
    view.addSubview(notesThoughtsTextView)
    notesThoughtsTextView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 30)
    
    view.addSubview(notesTextField)
    notesTextField.anchor(top: notesThoughtsTextView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 15, height: 230)
    
    return view
}()

let notesTextField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .none
    textField.font = UIFont.systemFont(ofSize: 16)
    textField.keyboardAppearance = .default
    textField.attributedPlaceholder = NSAttributedString(string: "What happened today?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
    //textField.backgroundColor = UIColor(red: 216/256, green: 216/256, blue: 216/256, alpha: 0.3)
    //textField.layer.cornerRadius = 12
    textField.textAlignment = .left
    return textField
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
        activitiesTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 100, width: view.frame.width)
        activitiesTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let activitiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        activitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activitiesCollectionView)
        activitiesCollectionView.anchor(top: activitiesTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 40)
        
        self.activitiesCollectionView = activitiesCollectionView
        
        self.view.addSubview(notesContainerView)
        notesContainerView.anchor(top: activitiesCollectionView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingRight: 20)
        
        self.view.addSubview(activitiesStackView)
        activitiesStackView.anchor(top: notesContainerView.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 10, paddingBottom: 10, height: 40)
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
        return CGSize(width: 40.0, height: 40.0)
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
