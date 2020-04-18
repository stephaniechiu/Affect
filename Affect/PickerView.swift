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

let popoverStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [cancelButton, doneButton])
    stackView.spacing = 45
    stackView.distribution = .fillEqually
    return stackView
}()

class PickerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
