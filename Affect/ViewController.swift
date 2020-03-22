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
    let dateTimeLabel: UILabel = {
        let now = Date()
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMd h:mm")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.text = dateFormatter.string(from: now)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont(name: "American Typewriter", size: 18)
            label.isUserInteractionEnabled = true
        return label
    }()
    
    var customView: UIView!
    
    private func loadCustomViewIntoController() {
        let customViewFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 200)
        customView = UIView(frame: customViewFrame)
        customView.backgroundColor = .red
        customView.alpha = 0.5

        view.addSubview(customView)

        customView.isHidden = false
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .green
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(didPressButtonFromCustomView), for:.touchUpInside)

        customView.addSubview(button)
    }

    @objc func didPressButtonFromCustomView(sender:UIButton) {
        customView.isHidden = true
    }
    
//    let dateTimePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//            picker.datePickerMode = .dateAndTime
//            picker.timeZone = NSTimeZone.local
//            picker.backgroundColor = UIColor.white
//            picker.translatesAutoresizingMaskIntoConstraints = false
//            picker.addTarget(self, action: #selector(dateChanged(dateTimePicker:)), for: .valueChanged)
//        return picker
//    }()
//
//    @objc func dateChanged(dateTimePicker: UIDatePicker) {
//        let dateFormatter = DateFormatter()
//            dateFormatter.locale = Locale(identifier: "en_US")
//            dateFormatter.setLocalizedDateFormatFromTemplate("MMMd h:mm")
//            dateTimeLabel.text = dateFormatter.string(from: dateTimePicker.date)
//    }
    @objc func labelClicked(_ sender: UITapGestureRecognizer? = nil) {
        //view.addSubview(dateTimePicker)
        //dateTimePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //dateTimePicker.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        loadCustomViewIntoController()
    }
//
//    var toolBar = UIToolbar()
//    func createToolbar() {
//        let toolbar = UIToolbar()
//        toolbar.barStyle = .default
//        toolbar.sizeToFit()
//        toolbar.frame = CGRect(x: 0, y: 0, width: dateTimePicker.frame.size.width, height: 44)
//        toolbar.isTranslucent = false
//
//        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed(sender:)))
//        toolBar.setItems([doneButton], animated: true)
//        toolBar.isUserInteractionEnabled = true
//
//    }
//    @objc func doneButtonPressed(sender: UIBarButtonItem) {
//        dateTimePicker.resignFirstResponder()
//    }
//
//    @objc func saveBtnClicked(_ button: UIBarButtonItem) {
//        dateTimePicker.resignFirstResponder()
//    }
            //input accessory view
//            let inputAccessoryView: UIView?
            
            //bar button
//            let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClick))
//            toolbar.setItems([doneBtn], animated: true)
            
            //assign toolbar
            //dateTimeLabel.inputAccessoryView = toolbar
            
            
//            label.addGestureRecognizer(guestureRecognizer)
//
//            //assign date picker to label
            
            //dateTimeLabel.inputView = datePicker
//        }
       // @objc func doneClick() {
//            let dateFormatter1 = DateFormatter()
//            dateFormatter1.dateStyle = .medium
//            dateFormatter1.timeStyle = .none
            //setNotification()
            //self.datePicker.resignFirstResponder()
//            datetime.isHidden = true
//            toolBar.isHidden = true
//        }
        
// MARK:- UI View
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.addSubview(moodQuestionTextView)
        view.addSubview(dateTimeLabel)
        setupLayout()
        //view.addSubview(dateTimePicker)
        
        let stackView = UIStackView(arrangedSubviews: setIconButton())
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        dateTimeLabel.addGestureRecognizer(tapGuestureRecognizer)
    }

// MARK:- Setup View Layout
    fileprivate func setupLayout() {
    //Set mood question view
        moodQuestionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        moodQuestionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //moodQuestionTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        moodQuestionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        moodQuestionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        //moodQuestionTextView.bottomAnchor.constraint(equalTo: iconImageView_Meh.topAnchor, constant: 150).isActive = true
    
    //Set DateTime label
        dateTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateTimeLabel.topAnchor.constraint(equalTo: moodQuestionTextView.bottomAnchor, constant: 12).isActive = true
    }
}
