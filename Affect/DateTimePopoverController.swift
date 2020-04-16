//
//  DateTimePopoverController.swift
//  Affect
//
//  Created by Stephanie on 4/12/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

let dateTimePicker: UIDatePicker = {
    let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.timeZone = NSTimeZone.local
        picker.backgroundColor = UIColor.white
        picker.translatesAutoresizingMaskIntoConstraints = false
    return picker
}()

class DateTimeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(dateTimePicker)
        dateTimePicker.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 10)
    }
}
