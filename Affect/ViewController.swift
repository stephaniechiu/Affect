//
//  ViewController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let iconImageView_Meh: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Meh"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let moodQuestionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "How are you?"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "American Typewriter", size: 35)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(iconImageView_Meh)
        view.addSubview(moodQuestionTextView)
        setupLayout()
        
        dateTimePicker()
    }
    
// MARK:- Date Time Picker
    fileprivate func dateTimePicker() {

    }
    
// MARK:- Setup View Layout
    fileprivate func setupLayout() {
        moodQuestionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        moodQuestionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moodQuestionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        moodQuestionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    
    //Set container view for mood icons
        let moodIconContainerView = UIView()
        moodIconContainerView.backgroundColor = .white
        view.addSubview(moodIconContainerView)
        moodIconContainerView.frame = CGRect(x: 0, y: 350, width: 500, height: 100)
        
        moodIconContainerView.translatesAutoresizingMaskIntoConstraints = false
        moodIconContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        moodIconContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        moodIconContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        moodIconContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        moodIconContainerView.addSubview(iconImageView_Meh)
        iconImageView_Meh.centerXAnchor.constraint(equalTo: moodIconContainerView.centerXAnchor).isActive = true
        iconImageView_Meh.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView_Meh.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}

