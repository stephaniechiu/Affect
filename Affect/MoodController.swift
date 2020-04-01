//
//  ViewController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class MoodController: UIViewController {

    let moodQuestionTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "How are you?", textSize: 35)
    }()
    
    //Date and Time label
    let dateTimeLabel: UILabel = {
        let now = Date()
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("h:mm")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.attributedText = NSAttributedString(string: "Today, " + dateFormatter.string(from: now), attributes:[.underlineStyle: NSUnderlineStyle.single.rawValue])
            label.textAlignment = .center
            label.font = UIFont(name: "American Typewriter", size: 18)
            label.isUserInteractionEnabled = true
        return label
    }()
    
    private func setIconButton() -> [UIButton] {
        let btnAwful: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Awful"))
        let btnOk: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Ok"))
        let btnMeh: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Meh"))
        let btnGreat: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Great"))
        let btnAwesome: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Awesome"))
        return [btnAwful, btnOk, btnMeh, btnGreat, btnAwesome]
    }

//Creates Date and Time picker view
    let dateTimePickerView: UIView = {
        let customView = UIView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        return customView
    }()
    
    let dateTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
            picker.datePickerMode = .dateAndTime
            picker.timeZone = NSTimeZone.local
            picker.backgroundColor = UIColor.white
            picker.translatesAutoresizingMaskIntoConstraints = false
            picker.addTarget(self, action: #selector(dateChanged(dateTimePicker:)), for: .valueChanged)
        return picker
    }()

//Date and Time label changes to what user chooses
    @objc func dateChanged(dateTimePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMd h:mm")
            dateTimeLabel.text = dateFormatter.string(from: dateTimePicker.date)
    }

//Date and Time picker UI
    private func loadDateTimePicker() {
    //Constraints for Date Time Picker view
        view.addSubview(dateTimePickerView)
        dateTimePickerView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, height: 240)
            dateTimePickerView.isHidden = false
    
    //Save button in the dateTimePicker view
        let saveButton = UIButton()
        saveButton.backgroundColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0)
            saveButton.setTitle("Save", for: .normal)
            saveButton.titleLabel?.font = UIFont(name: "American Typewriter", size: 18)
            saveButton.setTitleColor(.black, for: .normal)
            saveButton.addTarget(self, action: #selector(didPressButtonFromCustomView), for:.touchUpInside)
        dateTimePickerView.addSubview(saveButton)
            saveButton.translatesAutoresizingMaskIntoConstraints = false
            saveButton.anchor(top: dateTimePickerView.topAnchor, left: dateTimePickerView.leftAnchor, right: dateTimePickerView.rightAnchor)
            saveButton.centerX(inView: dateTimePickerView)
        
    //Constraints for dateTimePicker subview in the dateTimePicker view
        dateTimePickerView.addSubview(dateTimePicker)
        dateTimePicker.anchor(top: saveButton.bottomAnchor, left: dateTimePickerView.leftAnchor, bottom: dateTimePickerView.bottomAnchor, right: dateTimePickerView.rightAnchor)
        dateTimePicker.centerX(inView: dateTimePickerView)
    }

//Loads dateTimePicker when user clicks on dateTimeLabel
    @objc func labelClicked(_ sender: UITapGestureRecognizer? = nil) {
        loadDateTimePicker()
    }

//Hides dateTimePicker when user clicks on "Save" button
    @objc func didPressButtonFromCustomView(sender:UIButton) {
        dateTimePickerView.isHidden = true
    }
        
// MARK:- UI View
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        setupLayout()

    //User tap gesture recognizer on dateTimeLabel
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        dateTimeLabel.addGestureRecognizer(tapGuestureRecognizer)
    
    //Create stack view for mood icons
        let moodStackView = UIStackView(arrangedSubviews: setIconButton())
        moodStackView.translatesAutoresizingMaskIntoConstraints = false
        moodStackView.spacing = 20
        moodStackView.distribution = .fillEqually
        
        view.addSubview(moodStackView)

        moodStackView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 350, paddingLeft: 20, paddingBottom: 350, paddingRight: 20)
    }

// MARK:- Setup View Layout
    fileprivate func setupLayout() {
    //Set mood question
        view.addSubview(moodQuestionTextView)
        moodQuestionTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 100)
        moodQuestionTextView.centerX(inView: view)
    
    //Set DateTime label
        view.addSubview(dateTimeLabel)
        dateTimeLabel.centerX(inView: view)
        dateTimeLabel.anchor(top: moodQuestionTextView.safeAreaLayoutGuide.bottomAnchor, paddingTop: 12)
    }
}

