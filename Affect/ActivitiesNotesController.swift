//
//  ActivitiesNotesController.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ActivitiesNotesController: UIViewController {
    
    weak var activitiesCollectionView: UICollectionView!
    let activitiesCellIdentifier = "AnotherCell"
    
    // MARK: - Properties
    let activitiesTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "What have you been up to?", textSize: 35)
    }()

    //Notes & Thoughts - User Input
    let notesThoughtsTextView: UITextView = {
        let view = UIView().titleTextView(placeholderText: "notes & thoughts", textSize: 20)
        //view.backgroundColor = .orange
        //view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return view
    }()

    var userInputNotesContainerView: UIView = {
        let view = UIView().inputContainerView(placeholder: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
        view.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return view
    }()

    //Gratitude - User Input
    let gratitudeTextView: UITextView = {
        let view = UIView().titleTextView(placeholderText: "3 things I'm grateful for", textSize: 20)
        //view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return view
    }()

    var userInputGratitudeContainerView: UIView = {
        let view = UIView().inputContainerView(placeholder: "Gratituity is important!")
        //view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return view
    }()
    
    let nextBtn = UIView().navigationBtn(text: "Next")
    let saveBtn = UIView().navigationBtn(text: "Done")

    var columnLayout = ColumnFlowLayout(cellsPerRow: 5, minimumInteritemSpacing: 2, minimumLineSpacing: 2, sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    
    let activitiesImage: [UIImage] = [#imageLiteral(resourceName: "Family_b"), #imageLiteral(resourceName: "GoodMeal_b"), #imageLiteral(resourceName: "HealthyEating_b"), #imageLiteral(resourceName: "Sports_b"), #imageLiteral(resourceName: "Games_b"), #imageLiteral(resourceName: "Movies_b"), #imageLiteral(resourceName: "Travel_b"), #imageLiteral(resourceName: "Shopping_b"), #imageLiteral(resourceName: "Friends_b"), #imageLiteral(resourceName: "Gardening_b"), #imageLiteral(resourceName: "Hobby_b"), #imageLiteral(resourceName: "Exercise_b"), #imageLiteral(resourceName: "SocialMedia_b"), #imageLiteral(resourceName: "Reading_b"), #imageLiteral(resourceName: "Work_b"), #imageLiteral(resourceName: "GoodSleep_b"), #imageLiteral(resourceName: "Date_b")]
    

// MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        super.loadView()
        
        setupActivitiesLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupCollectionViewRegister()
        pushViewUpKeyboard()
    }
    
    // MARK: - Selectors
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }

    @objc func tapDone(sender: Any) {
        dismiss(animated: true, completion: nil)
    }

// MARK: - Helper Functions
    fileprivate func setupActivitiesLayout() {
//        self.navigationController?.setupNavigationBar()
        
        self.view.addSubview(activitiesTextView)
        activitiesTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        activitiesTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let activitiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        activitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activitiesCollectionView)
        activitiesCollectionView.anchor(top: activitiesTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 40, paddingRight: 40, height: 180)
        self.activitiesCollectionView = activitiesCollectionView
        
        self.view.addSubview(notesThoughtsTextView)
        notesThoughtsTextView.anchor(top: activitiesCollectionView.bottomAnchor, paddingTop: 10, height: 30)
        notesThoughtsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view.addSubview(userInputNotesContainerView)
        userInputNotesContainerView.anchor(top: notesThoughtsTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 40, paddingRight: 40)
        
        self.view.addSubview(gratitudeTextView)
        gratitudeTextView.anchor(top: userInputNotesContainerView.bottomAnchor, paddingTop: 10, height: 30)
        gratitudeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view.addSubview(userInputGratitudeContainerView)
        userInputGratitudeContainerView.anchor(top: gratitudeTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 40, paddingBottom: 20, paddingRight: 40)

//        let stack = UIStackView(arrangedSubviews: [notesThoughtsTextView, userInputNotesContainerView, gratitudeTextView, userInputGratitudeContainerView])
//        stack.axis = .vertical
//        stack.distribution = .fillEqually
//        //stack.spacing = 15
//
//        view.addSubview(stack)
//        stack.backgroundColor = .blue
//        stack.anchor(top: activitiesCollectionView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingRight: 20)
//        stack.setCustomSpacing(10, after: userInputNotesContainerView)
        let navBtnStackView = UIStackView(arrangedSubviews: [nextBtn, saveBtn])
        navBtnStackView.spacing = 180
        navBtnStackView.distribution = .fillEqually
        
        self.view.addSubview(navBtnStackView)
        navBtnStackView.anchor(top: userInputGratitudeContainerView.bottomAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingTop: 20, paddingBottom: 10)
        navBtnStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func setupCollectionViewRegister() {
        self.activitiesCollectionView.dataSource = self
        self.activitiesCollectionView.delegate = self
        self.activitiesCollectionView.register(ActivitiesCell.self, forCellWithReuseIdentifier: activitiesCellIdentifier)
        self.activitiesCollectionView.backgroundColor = .white
    }
    
    fileprivate func pushViewUpKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 20)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 30.0, height: 30.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}
