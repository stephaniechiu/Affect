//
//  ViewController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    let dateTimeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = "DateTime"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 18)
        return label
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
    
    // MARK:- Date Time Picker
    //    fileprivate func dateTimePicker() {
    //        let datePicker: UIDatePicker = UIDatePicker()
    //        datePicker.frame = CGRect(x: 10, y: 50, width: self.view.frame.width, height: 200)
    //
    //        // Set some of UIDatePicker properties
    //        datePicker.timeZone = NSTimeZone.local
    //        datePicker.backgroundColor = UIColor.white
    //
    //        // Add an event to call onDidChangeDate function when value is changed.
    //        datePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged(_:)), for: .valueChanged)
    //        //datePicker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    //        // Add DataPicker to the view
    //        self.view.addSubview(datePicker)
    //
    //        let toolBar = UIToolbar()
    //        toolBar.barStyle = .default
    //        toolBar.isTranslucent = true
    //        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
    //        toolBar.sizeToFit()
    //        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
    //        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    //        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
    //        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
    //        toolBar.isUserInteractionEnabled = true
    //
    //        view.addSubview(toolBar)
    //        toolBar.isHidden = false
    //
    //        func doneClick() {
    //             let dateFormatter1 = DateFormatter()
    //             dateFormatter1.dateStyle = .medium
    //             dateFormatter1.timeStyle = .none
    //             //setNotification()
    //             //self.datePicker.resignFirstResponder()
    //             datePicker.isHidden = true
    //             toolBar.isHidden = true
    //         }
    //
    //         func cancelClick() {
    //             datePicker.isHidden = true
    //             toolBar.isHidden = true
    //
    //         }
    //
    //    }
    //
    //    @objc func datePickerValueChanged(_ sender: UIDatePicker){
    //
    //        // Create date formatter
    //        let dateFormatter: DateFormatter = DateFormatter()
    //
    //        // Set date format
    //        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
    //
    //        // Apply date format
    //        let selectedDate: String = dateFormatter.string(from: sender.date)
    //
    //        print("Selected value \(selectedDate)")
    //    }
    
// MARK:- UI View
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(moodQuestionTextView)
        view.addSubview(dateTimeLabel)
        setupLayout()
        //dateTimePicker()
        
        let stackView = UIStackView(arrangedSubviews: setIconButton())
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }

// MARK:- Setup View Layout
    fileprivate func setupLayout() {
    //Set mood question view
        moodQuestionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        moodQuestionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        moodQuestionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        moodQuestionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    //Set DateTime label
        dateTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateTimeLabel.topAnchor.constraint(equalTo: moodQuestionTextView.bottomAnchor, constant: 12).isActive = true
    }

}
