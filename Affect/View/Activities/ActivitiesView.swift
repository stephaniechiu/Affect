//
//  ActivitiesView.swift
//  Affect
//
//  Created by Stephanie on 4/9/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

// MARK: - Properties
let activitiesTextView: UITextView = {
    return UIView().titleTextView(placeholderText: "What have you been up to?", textSize: 35)
}()

let activitiesStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: setNavButtons())
    stackView.spacing = 180
    stackView.distribution = .fillEqually
    return stackView
}()

//Notes & Thoughts - User Input
let notesThoughtsTextView: UITextView = {
    let view = UIView().titleTextView(placeholderText: "notes & thoughts", textSize: 20)
    view.backgroundColor = .orange
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

//Navigation Buttons: Cancel, Save
func setNavButtons() -> [UIButton]{
    let nextBtn = UIView().navigationBtn(text: "Next")
    let saveBtn = UIView().navigationBtn(text: "Done")
    return [nextBtn, saveBtn]
}

// MARK: - Lifecycle
class ActivitiesView: UIView {
    let activitiesNotesController = ActivitiesNotesController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
           addSubview(activitiesTextView)
           activitiesTextView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
           activitiesTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
           let stack = UIStackView(arrangedSubviews: [notesThoughtsTextView, userInputNotesContainerView, gratitudeTextView, userInputGratitudeContainerView])
           stack.axis = .vertical
           stack.distribution = .fillEqually
           //stack.spacing = 15
           
           addSubview(stack)
           stack.backgroundColor = .blue
        stack.anchor(top: activitiesNotesController.activitiesCollectionView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 20, paddingRight: 20)
           
           addSubview(activitiesStackView)
           activitiesStackView.anchor(top: stack.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, paddingTop: 20, paddingBottom: 10)
           activitiesStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
       }
    
}
