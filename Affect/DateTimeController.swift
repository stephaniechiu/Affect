//
//  DateTimePopoverController.swift
//  Affect
//
//  Created by Stephanie on 4/12/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class DateTimeController: UIViewController {

    let dateTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
            picker.datePickerMode = .dateAndTime
            picker.timeZone = NSTimeZone.local
            picker.backgroundColor = UIColor.white
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(dateTimePicker)
    }
}
