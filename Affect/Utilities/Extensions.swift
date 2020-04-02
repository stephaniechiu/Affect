//
//  Extensions.swift
//  Affect
//
//  Created by Stephanie on 3/26/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension UIView {
    func titleTextView(placeholderText: String, textSize: CGFloat) -> UITextView {
        let textView = UITextView()
        textView.text = placeholderText
        textView.font = UIFont(name: "American Typewriter", size: textSize)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.lineBreakMode = .byWordWrapping
        return textView
    }
    
    func iconBtn(image: UIImage) -> UIButton {
        let iconBtnImage = UIButton(type: .custom)
        iconBtnImage.setImage(image, for: .normal)
        iconBtnImage.imageView?.contentMode = .scaleAspectFit
        return iconBtnImage
    }
    
    func inputContainerView(textField: String) -> UIView {
        let view = UIView()
        return view
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
    
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}


