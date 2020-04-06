//
//  FeelingsController.swift
//  Affect
//
//  Created by Stephanie on 4/5/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

private let cellIdentifier = "Cell"

var positiveFeelingsLabel: [String] = ["understanding", "confident", "sympathetic", "satisfied", "kind", "great", "lucky", "fortunate", "important", "bold", "playful", "energetic", "optimistic", "free", "wonderful", "pleased", "comfortable", "calm", "relaxed", "blessed", "loving", "eager"]

var negativeFeelingsLabel: [String] = ["irritated", "disappointed", "ashamed", "miserable", "upset", "indecisive", "embarrassed", "shy", "alone", "fatigued", "stressed", "tense", "resentful", "nervous", "suspicious", "offended", "nonchalant", "bored", "wronged", "dismayed", "threatened", "terrified"]

class ViewController: UIViewController {

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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRe()
    }

// MARK: - Helper Functions
    fileprivate func setupCollectionViews() {
        let positiveCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(positiveCollectionView)
        positiveCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.anchor(top: positiveCollectionView.topAnchor, paddingTop: 20)
//        positiveCollectionView.centerX(inView: view)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: positiveCollectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: positiveCollectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: positiveCollectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: positiveCollectionView.trailingAnchor),
        ])
        self.positiveCollectionView = positiveCollectionView
        
        let negativeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(negativeCollectionView)
        self.view.anchor(top: positiveCollectionView.bottomAnchor, bottom: negativeCollectionView.bottomAnchor, paddingTop: 30, paddingLeft: -20, paddingRight: -20)
        negativeCollectionView.centerX(inView: view)

        self.negativeCollectionView = negativeCollectionView
        negativeCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func setupRe() {
        self.positiveCollectionView.dataSource = self
        self.positiveCollectionView.delegate = self
        self.positiveCollectionView.register(FeelingsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.positiveCollectionView.backgroundColor = .yellow
        
        self.negativeCollectionView.dataSource = self
        self.negativeCollectionView.delegate = self
        self.negativeCollectionView.register(FeelingsCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.negativeCollectionView.backgroundColor = .lightGray
    }
}

// MARK: - UICollectionView Data Source
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == positiveCollectionView {
            return positiveFeelingsLabel.count
        } else if collectionView == negativeCollectionView {
            return negativeFeelingsLabel.count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! FeelingsCell
        
        if collectionView == positiveCollectionView {
            cell.cellLabel.text = positiveFeelingsLabel[indexPath.row]
            positiveFeelingsLabel.sort()
            cell.backgroundColor = .orange
        } else {
            cell.cellLabel.text = negativeFeelingsLabel[indexPath.row]
            negativeFeelingsLabel.sort()
            cell.backgroundColor = .yellow
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 150)
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

