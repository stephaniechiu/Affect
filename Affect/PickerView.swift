//
//  DateTimePopoverController.swift
//  Affect
//
//  Created by Stephanie on 4/12/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class PickerView: UIView {
// MARK: - Properties
    let dateTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
            picker.datePickerMode = .dateAndTime
            picker.timeZone = NSTimeZone.local
            picker.backgroundColor = UIColor.white
        return picker
    }()

    let popoverView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = .white
        return view
    }()

    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    let popoverStackView: UIStackView

// MARK: - Lifecycle
    override init(frame: CGRect) {
        self.popoverStackView = UIStackView(arrangedSubviews: [cancelButton, doneButton])
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
