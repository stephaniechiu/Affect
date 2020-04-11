//
//  FeelingsController.swift
//  Affect
//
//  Created by Stephanie on 4/5/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

private let positiveCellID = "PositiveCell"
private let negativeCellID = "NegativeCell"
private let positiveHeaderID = "PositiveHeader"
private let negativeHeaderID = "NegativeHeader"

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
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let height = UIScreen.main.bounds.size.height
        flowLayout.estimatedItemSize = CGSize(width: 20, height: height)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.backgroundColor = .clear
        return cv
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
        
        setupCollectionViewRegisters()
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
        feelingsTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingRight: 20)
        
        self.view.addSubview(collectionView)
        collectionView.anchor(top: feelingsTextView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        self.view.addSubview(nextBtn)
        nextBtn.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 25)
        nextBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextBtn.addTarget(self, action: #selector(nextViewActivities), for: .touchUpInside)
    }
    
    fileprivate func setupCollectionViewRegisters() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.allowsMultipleSelection = true
        
        //Register collection headers
        self.collectionView.register(PositiveFeelingsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: positiveHeaderID)
        self.collectionView.register(NegativeFeelingsHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: negativeHeaderID)
        
        //Register cells
        self.collectionView.register(PositiveFeelingsCell.self, forCellWithReuseIdentifier: positiveCellID)
        self.collectionView.register(NegativeFeelingsCell.self, forCellWithReuseIdentifier: negativeCellID)
    }
}

// MARK: - UICollectionView Data Source
extension FeelingsController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 1 {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: negativeHeaderID, for: indexPath) as! NegativeFeelingsHeader
            
            return header
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: positiveHeaderID, for: indexPath) as! PositiveFeelingsHeader
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return negativeFeelingsLabel.count
        }
        return positiveFeelingsLabel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: negativeCellID, for: indexPath) as! NegativeFeelingsCell
                negativeFeelingsLabel.sort()
                cell.cellLabel.text = negativeFeelingsLabel[indexPath.row]
                
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: positiveCellID, for: indexPath) as! PositiveFeelingsCell
            positiveFeelingsLabel.sort()
            cell.cellLabel.text = positiveFeelingsLabel[indexPath.row]
            

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
        return UIEdgeInsets(top: 15, left: 20, bottom: 10, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}

extension FeelingsController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            
            cell.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            if let cell = collectionView.cellForItem(at: indexPath) {
                cell.backgroundColor = .white
            }
        }
    }
    
    
