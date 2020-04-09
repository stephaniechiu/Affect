//
//  ViewController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class MoodController: UIViewController {

    let moodView = MoodView()
      
// MARK: - Lifecycle
    override func loadView() {
        view = moodView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBarItems()
    //User tap gesture recognizer on dateTimeLabel
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        dateTimeLabel.addGestureRecognizer(tapGuestureRecognizer)
        dateTimePicker.addTarget(self, action: #selector(dateChanged(dateTimePicker:)), for: .valueChanged)
    }

    // MARK: - Selectors
    //Loads dateTimePicker when user clicks on dateTimeLabel
        @objc func labelClicked(_ sender: UITapGestureRecognizer? = nil) {
            loadDateTimePicker()
        }

    //Hides dateTimePicker when user clicks on "Save" button
        @objc func didPressButtonFromCustomView(sender:UIButton) {
            dateTimePickerView.isHidden = true
        }
      @objc func dateChanged(dateTimePicker: UIDatePicker) {
          let dateFormatter = DateFormatter()
              dateFormatter.locale = Locale(identifier: "en_US")
              dateFormatter.setLocalizedDateFormatFromTemplate("MMMd h:mm")
              dateTimeLabel.text = dateFormatter.string(from: dateTimePicker.date)
        }
    
    //Exits from view
      @objc func closeView(_ sender: UITapGestureRecognizer? = nil){
         print("clicked")
        }
 
// MARK: - Helper Functions
    private func setupNavigationBarItems() {
        navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        let closeImageView = UIButton(type: .custom)
        closeImageView.setImage(#imageLiteral(resourceName: "btn_close_b").withRenderingMode(.alwaysOriginal), for: .normal)
        closeImageView.anchor(width: 12, height: 12)
        closeImageView.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        
        let logoutBarButtonItem = UIBarButtonItem.init(customView: closeImageView)
        self.navigationItem.leftBarButtonItem  = logoutBarButtonItem
    }
    
    func loadDateTimePicker() {
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
}

