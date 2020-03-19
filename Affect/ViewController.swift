//
//  ViewController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let moodIconContainerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .blue
        containerView.frame = CGRect(x: 0, y: 350, width: 500, height: 100)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
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
    
    let dateTimeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.text = "DateTime"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: "American Typewriter", size: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(iconImageView_Meh)
        view.addSubview(moodQuestionTextView)
        view.addSubview(dateTimeLabel)
        view.addSubview(moodIconContainerView)
        setupLayout()
        
        //dateTimePicker()
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
        
    //Set container view for mood icons
        moodIconContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        moodIconContainerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        moodIconContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        moodIconContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        moodIconContainerView.addSubview(iconImageView_Meh)
        
        iconImageView_Meh.centerXAnchor.constraint(equalTo: moodIconContainerView.centerXAnchor).isActive = true
        iconImageView_Meh.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView_Meh.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }


}

