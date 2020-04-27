//
//  ActivitiesNotesController.swift
//  Affect
//
//  Created by Stephanie on 3/30/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import CoreData


var notesInputTextView: UITextView = {
    let inputView = UIView().inputTextView(placeholder: "Type anything...")
    return inputView
}()

class ActivitiesNotesController: UIViewController {
    let homeController = HomeController()
    let customNavigationController = CustomNavigationController()
    
//    var thoughtsEntries: [NSManagedObject] = []
    
    weak var activitiesCollectionView: UICollectionView!
    let activitiesCellIdentifier = "AnotherCell"
    
    // MARK: - Properties
    let activitiesTextView: UITextView = {
        return UIView().titleTextView(text: "What have you been up to?", textSize: 35)
    }()

    //Notes & Thoughts - User Input
    let notesThoughtsTextView: UITextView = {
        let view = UIView().titleTextView(text: "notes & thoughts", textSize: 20)
        view.backgroundColor = .white
        //view.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return view
    }()
    
    lazy var userNotesInputContainerView: UIView = {
        let containerView = UIView().inputContainerView(inputTextView: notesInputTextView)
        containerView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        return containerView
    }()

    //Gratitude - User Input
    let gratitudeTextView: UITextView = {
        let view = UIView().titleTextView(text: "3 things I'm grateful for", textSize: 20)
        return view
    }()
    
    let gratituityInputTextView: UITextView = {
        let inputView = UIView().inputTextView(placeholder: "Gratituity is great")
        return inputView
    }()

    lazy var userInputGratitudeContainerView: UIView = {
        let containerView = UIView().inputContainerView(inputTextView: gratituityInputTextView)
        containerView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        return containerView
    }()
    
    let nextBtn = UIView().navigationBtn(text: "Next")
    let saveBtn = UIView().navigationBtn(text: "Save")

    var columnLayout = ColumnFlowLayout(cellsPerRow: 5, minimumInteritemSpacing: 2, minimumLineSpacing: 2, sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    
    let activitiesImage: [UIImage] = [#imageLiteral(resourceName: "Family_b"), #imageLiteral(resourceName: "GoodMeal_b"), #imageLiteral(resourceName: "HealthyEating_b"), #imageLiteral(resourceName: "Sports_b"), #imageLiteral(resourceName: "Games_b"), #imageLiteral(resourceName: "Movies_b"), #imageLiteral(resourceName: "Travel_b"), #imageLiteral(resourceName: "Shopping_b"), #imageLiteral(resourceName: "Friends_b"), #imageLiteral(resourceName: "Gardening_b"), #imageLiteral(resourceName: "Hobby_b"), #imageLiteral(resourceName: "Exercise_b"), #imageLiteral(resourceName: "SocialMedia_b"), #imageLiteral(resourceName: "Reading_b"), #imageLiteral(resourceName: "Work_b"), #imageLiteral(resourceName: "GoodSleep_b"), #imageLiteral(resourceName: "Date_b")]
    

// MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        fetchData()
    }
    
    override func loadView() {
        super.loadView()
        
        setupActivitiesLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        customNavigationController.setupNavigationBar()
        setupCollectionViewRegister()
        pushViewUpKeyboard()
        
        saveBtn.addTarget(self, action: #selector(save(sender:)), for: .touchUpInside)
        homeController.tableView.reloadData()
    }
    
    // MARK: - Selectors
    @objc func save(sender: UIButton) {
        var textView = UITextView()
        textView = notesInputTextView
        homeController.entryInput.append(textView.text!)
        homeController.tableView.reloadData()
        print(notesInputTextView.text!)
        print(homeController.entryInput)
        
        dismiss(animated: true, completion: nil)
    }
    
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

    //Dismisses keyboard when "Done" is tapped
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }

// MARK: - Helper Functions
    fileprivate func setupActivitiesLayout() {
        self.view.addSubview(activitiesTextView)
        activitiesTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        activitiesTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let activitiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: columnLayout)
        activitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(activitiesCollectionView)
        activitiesCollectionView.anchor(top: activitiesTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 40, paddingRight: 40, height: 180)
        self.activitiesCollectionView = activitiesCollectionView
        
        self.view.addSubview(notesThoughtsTextView)
        notesThoughtsTextView.anchor(top: activitiesCollectionView.bottomAnchor, paddingTop: 10, height: 30)
        notesThoughtsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view.addSubview(userNotesInputContainerView)
        userNotesInputContainerView.anchor(top: notesThoughtsTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 40, paddingRight: 40)
        
        self.view.addSubview(gratitudeTextView)
        gratitudeTextView.anchor(top: userNotesInputContainerView.bottomAnchor, paddingTop: 10, height: 30)
        gratitudeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view.addSubview(userInputGratitudeContainerView)
        userInputGratitudeContainerView.anchor(top: gratitudeTextView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 40, paddingBottom: 20, paddingRight: 40)

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
