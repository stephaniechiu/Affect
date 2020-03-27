//
//  ViewController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

// MARK:- Properties
    let moodQuestionTextView: UITextView = {
        let textView = UITextView()
            textView.text = "How are you?"
//            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.font = UIFont(name: "American Typewriter", size: 35)
            textView.textAlignment = .center
            textView.isEditable = false
            textView.isScrollEnabled = false
        return textView
    }()

    private func setIconButton() -> [UIButton] {
        let iconBtnAwful:UIButton = UIButton(type: .custom)
            iconBtnAwful.setImage(#imageLiteral(resourceName: "Awful"), for: .normal)
            iconBtnAwful.imageView?.contentMode = .scaleAspectFit
        let iconBtnOk:UIButton = UIButton(type: .custom)
            iconBtnOk.setImage(#imageLiteral(resourceName: "Ok"), for: .normal)
            iconBtnOk.imageView?.contentMode = .scaleAspectFit
        let iconBtnMeh:UIButton = UIButton(type: .custom)
            iconBtnMeh.setImage(#imageLiteral(resourceName: "Meh"), for: .normal)
            iconBtnMeh.imageView?.contentMode = .scaleAspectFit
        let iconBtnGreat:UIButton = UIButton(type: .custom)
            iconBtnGreat.setImage(#imageLiteral(resourceName: "Great"), for: .normal)
            iconBtnGreat.imageView?.contentMode = .scaleAspectFit
        let iconBtnAwesome:UIButton = UIButton(type: .custom)
            iconBtnAwesome.setImage(#imageLiteral(resourceName: "Awesome"), for: .normal)
            iconBtnAwesome.imageView?.contentMode = .scaleAspectFit
        return [iconBtnAwesome, iconBtnGreat, iconBtnMeh, iconBtnOk, iconBtnAwful]
    }
    
//Date and Time label
    let dateTimeLabel: UILabel = {
        let now = Date()
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("h:mm")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.attributedText = NSAttributedString(string: "Today, " + dateFormatter.string(from: now), attributes:[.underlineStyle: NSUnderlineStyle.single.rawValue])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont(name: "American Typewriter", size: 18)
            label.isUserInteractionEnabled = true
        return label
    }()


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
            dateTimePickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            dateTimePickerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            dateTimePickerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            dateTimePickerView.heightAnchor.constraint(equalToConstant: 240).isActive = true
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
            saveButton.topAnchor.constraint(equalTo: dateTimePickerView.topAnchor).isActive = true
            saveButton.centerXAnchor.constraint(equalTo: dateTimePickerView.centerXAnchor).isActive = true
            saveButton.leftAnchor.constraint(equalTo: dateTimePickerView.leftAnchor).isActive = true
            saveButton.rightAnchor.constraint(equalTo: dateTimePickerView.rightAnchor).isActive = true
        
    //Constraints for dateTimePicker subview in the dateTimePicker view
        dateTimePickerView.addSubview(dateTimePicker)
            dateTimePicker.centerXAnchor.constraint(equalTo: dateTimePickerView.centerXAnchor).isActive = true
            dateTimePicker.bottomAnchor.constraint(equalTo: dateTimePickerView.bottomAnchor).isActive = true
            dateTimePicker.leftAnchor.constraint(equalTo: dateTimePickerView.leftAnchor).isActive = true
            dateTimePicker.rightAnchor.constraint(equalTo: dateTimePickerView.rightAnchor).isActive = true
            dateTimePicker.topAnchor.constraint(equalTo: saveButton.bottomAnchor).isActive = true
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
        view.addSubview(moodQuestionTextView)
        view.addSubview(dateTimeLabel)
        
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
        
        moodStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        moodStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        moodStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        moodStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    }

// MARK:- Setup View Layout
    fileprivate func setupLayout() {
    //Set mood question vi
        moodQuestionTextView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 150)
        moodQuestionTextView.centerX(inView: view)
    
    //Set DateTime label
        dateTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateTimeLabel.topAnchor.constraint(equalTo: moodQuestionTextView.bottomAnchor, constant: 12).isActive = true
    }
}

