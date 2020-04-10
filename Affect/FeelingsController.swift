//
//  FeelingsController.swift
//  Affect
//
//  Created by Stephanie on 4/5/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

private let cellIdentifier = "Cell"

let feelingsTextView: UITextView = {
    return UIView().titleTextView(placeholderText: "What describes your feelings?", textSize: 35)
}()

let nextBtn: UIButton = {
    return UIView().navigationBtn(text: "Next")
}()

var positiveFeelingsLabel: [String] = ["understanding", "confident", "sympathetic", "satisfied", "kind", "great", "lucky", "fortunate", "important", "bold", "playful", "energetic", "optimistic", "free", "wonderful", "pleased", "comfortable", "calm", "relaxed", "blessed", "loving", "eager"]

var negativeFeelingsLabel: [String] = ["irritated", "disappointed", "ashamed", "miserable", "upset", "indecisive", "embarrassed", "shy", "alone", "fatigued", "stressed", "tense", "resentful", "nervous", "suspicious", "offended", "nonchalant", "bored", "wronged", "dismayed", "threatened", "terrified"]

class FeelingsController: UIViewController {

// MARK: - Properties
    weak var positiveCollectionView: UICollectionView!
    weak var negativeCollectionView: UICollectionView!

    var layout: UICollectionViewFlowLayout = {
            let layout = UICollectionViewFlowLayout()
            let height = UIScreen.main.bounds.size.height
            layout.estimatedItemSize = CGSize(width: 20, height: height)
            return layout
        }()

// MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
    
        setupCollectionViews()
        setupNavigationBarItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRe()
    }

// MARK: - Selectors
    @objc func closeView(_ sender: UITapGestureRecognizer? = nil){
            let homeController = HomeController()
            navigationController?.pushViewControllerFromTop(controller: homeController)
    }
     
    @objc func nextViewActivities() {
        let activitiesController = ActivitiesNotesController()
        navigationController?.pushViewController(activitiesController, animated: true)
    }
    
// MARK: - Helper Functions
    private func setupNavigationBarItems() {
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        let closeImageView: UIButton = {
                return UIView().navigationBarItemImage(image: #imageLiteral(resourceName: "btn_close_b"))
        }()
        closeImageView.addTarget(self, action: #selector(closeView), for: .touchUpInside)

        let closeBarButtonItem = UIBarButtonItem.init(customView: closeImageView)
        self.navigationItem.leftBarButtonItem = closeBarButtonItem
    }
    
    fileprivate func setupCollectionViews() {
        self.view.addSubview(feelingsTextView)
        feelingsTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        feelingsTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let positiveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        positiveCollectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(positiveCollectionView)
        positiveCollectionView.topAnchor.constraint(equalTo: feelingsTextView.bottomAnchor, constant: 20).isActive = true
        positiveCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        positiveCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        positiveCollectionView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.positiveCollectionView = positiveCollectionView
        
        self.view.addSubview(nextBtn)
        nextBtn.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 25)
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextBtn.addTarget(self, action: #selector(nextViewActivities), for: .touchUpInside)
    }
    
    fileprivate func setupRe() {
        self.positiveCollectionView.dataSource = self
        self.positiveCollectionView.delegate = self
        self.positiveCollectionView.register(PositiveCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.positiveCollectionView.backgroundColor = .darkGray
    }
}

// MARK: - UICollectionView Data Source
extension FeelingsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return positiveFeelingsLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PositiveCell
        positiveFeelingsLabel.sort()
        cell.cellLabel.text = positiveFeelingsLabel[indexPath.row]
        //cell.backgroundColor = .orange
        return cell
    }
}

extension FeelingsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}

